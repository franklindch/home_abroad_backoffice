class AttendantsController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_attendant, only: [:edit, :update, :destroy]

	def new
	  @attendant = Attendant.new
	end

	def create
	  @attendant = Attendant.new(attendant_params)
	  if @attendant.save
	    # attendantMailer.with(attendant: @attendant).welcome_email.deliver_now
	    redirect_to attendants_path
	  else
	    render :new
	  end
	end

	def edit; end

	def update
	  @attendant.update(attendant_params)
	  redirect_to attendants_path
	end

	def destroy
	  @attendant.destroy
	  redirect_to attendants_path
	end

	def index
	  @attendants = Attendant.order(:first_name).page(params[:page])
	  respond_to do |format|
	    format.html
	    format.js
	  end

	  if params[:query].present?
	    @attendants = Attendant.search_by_full_name(params[:query]).page(params[:query])
	  else
	    @attendants = Attendant.order(:first_name).page params[:page]
	  end
	end

	private

	def retrieve_attendant
	  @attendant ||= Attendant.find(params[:id])
	end

	def attendant_params
	  params.require(:attendant).permit(
	    :first_name, :last_name, :email, :phone, :intl_number, :birth_date, :zip_code, :address
	  )
	end
end
