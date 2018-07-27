class InvoicesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_invoice, only: [:edit, :update, :destroy]
	before_action :retrieve_language_stay, only: [:new, :edit, :update, :destroy, :create]

	def new
	  @invoice = Invoice.new
	end

	def create
	  @invoice = Invoice.new(invoice_params)
	  @invoice.language_stay_id = @language_stay
	  client = @language_stay.client
	  if @invoice.save
	    redirect_to client_path(client)
	  else
	    render :new
	  end
	end

	def edit; end

	def update
	  @invoice.update(invoice_params)
	  redirect_to families_path
	end

	def destroy
	  @invoice.destroy
	  redirect_to families_path
	end

	private

	def retrieve_language_stay
		@language_stay ||= LanguageStay.find(params[:language_stay_id])
		
	end

	def invoice_params
	  params.require(:invoice).permit(
	    :name, :invoice_situation, :address_1, :address_2, :zip_code, :phone, :email, :city, :language_stay_id
	  )    
	end
end
