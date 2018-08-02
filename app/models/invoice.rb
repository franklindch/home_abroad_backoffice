class Invoice < ApplicationRecord
	monetize :application_fee_price_cents, disable_validation: true
	monetize :language_stay_price_cents, disable_validation: true
	monetize :travel_price_cents, disable_validation: true
	monetize :total_price, as: 'total', disable_validation: true

	has_many :payments, dependent: :destroy, inverse_of: :invoice
	accepts_nested_attributes_for :payments, reject_if: :all_blank, allow_destroy: true
	belongs_to :language_stay, optional: true

	def total
	  return application_fee_price_cents + language_stay_price_cents + travel_price_cents
	end
end
