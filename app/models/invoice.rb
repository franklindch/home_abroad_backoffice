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

  after_save :calculate_total

  def self.still_need_payment

  end

  def calculate_total
    result = self&.transfer_price_cents.to_f + self&.option_1_price_cents.to_f + self&.travel_price_cents.to_f + self&.application_fee_price_cents.to_f + self&.language_stay_price_cents.to_f + self&.option_2_price_cents.to_f + self&.option_3_price_cents.to_f
    self.update_columns(total_price_cents: result)
  end

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

  def self.still_need_payment
    all.select{|invoice| !(invoice.acquittée?)}
  end
end

