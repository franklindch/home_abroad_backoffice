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
    redirect_to client_path(@invoice.language_stay.client)
	  flash[:notice] = "Facture éditée avec succès !"
  end

	def destroy
	  @invoice.destroy
	  redirect_to client_path(@invoice.language_stay.client)
	end

	def invoice
    @invoice = Invoice.find(params[:invoice])
    generate_invoice_pdf(@invoice)
	end

	def paid_invoice
		@invoice = Invoice.find(params[:paid_invoice])
	  generate_paid_invoice_pdf(@invoice)
	end

  def still_need_payment
    @invoices = Invoice.order_by_language_stays_start_date.still_need_payment
    respond_to do |format|
      format.html
      format.js
    end
  end

  def download_invoices
    @invoices = Invoice.order_by_language_stays_start_date.still_need_payment
    respond_to do |format|
      format.html
      format.xlsx { render filename: "Récap factures au #{Date.today}" }
    end
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
		  :total_price_cents,
      :option_3_price_cents,
      :option_3_price_currency,
	    payments_attributes: [
	    	:category, :payment_date, :id, :amount_price_cents, :nature, :comment, :_destroy
	    ]
	  )
	end
end
