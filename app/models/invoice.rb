class Invoice < ApplicationRecord
	register_currency :eur

	monetize :application_fee_price_cents,
			 :language_stay_price_cents,
			 :travel_price_cents,
			 :transfer_price_cents,
			 :option_1_price_cents,
			 :option_2_price_cents,
			 :total_price_cents

	has_many :payments, dependent: :destroy, inverse_of: :invoice
	accepts_nested_attributes_for :payments, reject_if: :all_blank, allow_destroy: true
	belongs_to :language_stay

  def remboursements
    payments.where(category: 'Remboursement')
  end


  def règlements
    payments.where(category: 'Règlement')
  end

  def total_règlements
    sum = 0
    règlements.each { |payment| sum += payment.amount_price_cents}
    return sum
  end

	def total_remboursements
		sum = 0
		remboursements.each { |payment| sum += payment.amount_price_cents}
		return sum
	end

  def acquittée?
    (self.total_règlements - self.total_remboursements) == self.total_price_cents
  end
end
