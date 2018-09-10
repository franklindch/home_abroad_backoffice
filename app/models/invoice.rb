class Invoice < ApplicationRecord
	after_save :verify_payment_coherence

	register_currency :eur

	monetize :application_fee_price_cents, 
			 :language_stay_price_cents,
			 :travel_price_cents,
			 :transfer_price_cents,
			 :option_1_price_cents,
			 :option_2_price_cents,
			 :camp_fee_amount_price_cents,
			 :camp_fee_total_price_cents,
			 :total_price_cents

	has_many :payments, dependent: :destroy, inverse_of: :invoice
	accepts_nested_attributes_for :payments, reject_if: :all_blank, allow_destroy: true
	belongs_to :language_stay

	def total_payments
		sum = 0
		payments.each { |payment| sum += payment.amount_price_cents}
		return sum
	end

  def verify_payment_coherence
  	self.total_payments > self.total_price_cents
  end
end
