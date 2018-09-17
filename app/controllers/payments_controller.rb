class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_invoice, only: [:edit, :update, :destroy]
  before_action :retrieve_payment, only: [:edit, :update, :destroy]

  def edit; end

  def update
    @payment.update(payment_params)
    flash[:notice] = 'Payment édité avec succès'
    redirect_to client_path(@invoice.language_stay.client)
  end

  def destroy
    @payment.destroy
    redirect_to client_path(@invoice.language_stay.client)
  end

  private

  def retrieve_invoice
    @invoice ||= Invoice.find(params[:invoice_id])
  end

  def retrieve_payment
    @payment ||= Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(
      :payment_date, :id, :amount_price_cents, :nature, :comment
    )
  end
end
