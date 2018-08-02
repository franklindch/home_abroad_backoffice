class ProgramsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_program, only: [:edit, :update, :destroy, :show]

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

	def edit
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
		@programs = Program.order(:explicit_name).page params[:page]
		respond_to do |format|
			format.html
	    format.js
	  end	

	  if params[:query].present?
	    @programs = Program.search_by_explicit_name(params[:query]).page params[:page]
	  else
	    @programs = Program.order(:explicit_name).page params[:page]
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

	def search_for_child_detail
		child_detail = ChildDetail.find(params[:child_detail_id])
	  @program = program.new(first_name: child_detail.first_name, last_name: child_detail.last_name, age: child_detail.age)
	  respond_to do |format|
	    format.html # new.html.erb
	    format.xml  { render xml: @program }
	  end
	end

	def retrieve_program
	  @program ||= Program.find(params[:id])
	end

	def retrieve_family
	  @family ||= Program.find(params[:program][:family_id])
	end

	def program_params
	  params.require(:program).permit(
	  	:nature, :explicit_name, :address, :zip_code
	  )
	end
end
