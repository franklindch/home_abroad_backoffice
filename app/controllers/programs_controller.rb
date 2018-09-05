class ProgramsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_program, only: [:destroy, :show]

	def new
		@program = Program.new
	end

	def create
	  @program = Program.new(program_params)
	  if @program.save
	  	redirect_to programs_path
	  else
	  	render :new
	  end
	end

	def update
	  @program.update(program_params)
	  redirect_to programs_path
	end

	def destroy
	  @program.destroy
	  redirect_to programs_path
	end

	def index
		@programs = Program.order(:name).page params[:page]
		respond_to do |format|
			format.html
	    format.js
	  end	

	  if params[:query].present?
	    @programs = Program.search_by_name(params[:query]).page params[:page]
	  else
	    @programs = Program.order(:name).page params[:page]
	  end
	end

	def show
	  respond_to do |format|
	    format.html
	    format.pdf do
	      render pdf: "#{@program.name}",
	             template: 'pdf/invoice.html.slim',
	             disposition: 'attachment',
	             layout: 'pdf'
	    end
		end
	end

	private

	def retrieve_program
	  @program ||= Program.find(params[:id])
	end

	def program_params
	  params.require(:program).permit(
	  	:name, :program_code
	  )
	end
end
