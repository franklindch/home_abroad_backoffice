class InvoicesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_invoice, only: [:edit, :update, :destroy]
	before_action :retrieve_language_stay, only: [:new, :edit, :update, :destroy, :create]

	def new
	  @invoice = Invoice.new
	  create_payments
	end

	def create
	  @invoice = Invoice.new(invoice_params)
	  @invoice.language_stay = @language_stay
	  client = @language_stay.client
	  if @invoice.save
	  	flash[:notice] = "Facture ajoutée avec succès !"
	    redirect_to client_path(client)
	  else
	  	flash[:alert] = "Merci de lire les messages d'erreur."
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

	def create_payments
		2.times do
		  @invoice.payments.build
		end
	end

	def retrieve_language_stay
		@language_stay ||= LanguageStay.find(params[:language_stay_id])
	end

	def retrieve_invoice
		@invoice ||= Invoice.find(params[:id])
	end

	def invoice_params
	  params.require(:invoice).permit(
	    :application_fee_price_cents, :language_stay_price_cents, :travel_price_cents, :total_price, :language_stay_id,
	    payments_attributes: [
	    	:id, :amount_price_cents, :nature, :comment, :_destroy
	    ]
	  )    
	end
end
