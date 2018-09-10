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
	  payments_coherence
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
	  payments_coherence
	  redirect_to client_path(@invoice.language_stay.client)
	end

	def destroy
	  @invoice.destroy
	  redirect_to client_path(@invoice.language_stay.client)
	end

	def invoice
		@invoice = Invoice.find(params[:invoice])
	  generate_invoice_pdf(@invoice)
		# fields_filled(@language_stay)
	end

	def paid_invoice
		@invoice = Invoice.find(params[:paid_invoice])
	  generate_paid_invoice_pdf(@invoice)
		# fields_filled(@language_stay)
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
	  	:application_fee_price_cents, 
		  :language_stay_price_cents,
		  :travel_price_cents,
		  :transfer_price_cents,
		  :option_1_price_cents,
		  :option_2_price_cents,
		  :camp_fee_amount_price_cents,
		  :camp_fee_total_price_cents,
		  :total_price_cents,
		  :camp_fee_percentage,
	    payments_attributes: [
	    	:id, :amount_price_cents, :nature, :comment, :_destroy
	    ]
	  )    
	end

	def payments_coherence
		if @invoice.verify_payment_coherence
			flash[:alert] = "Montant des payments sup. à montant facture: in"
			render :new 
		end
	end
end
