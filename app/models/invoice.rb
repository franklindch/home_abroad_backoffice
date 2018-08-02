class Invoice < ApplicationRecord
	monetize :application_fee_price_cents, disable_validation: true
	monetize :language_stay_price_cents, disable_validation: true
	monetize :travel_price_cents, disable_validation: true
	monetize :total_price, as: 'total', disable_validation: true
	belongs_to :language_stay, optional: true

	def total
	  return application_fee_price_cents + language_stay_price_cents + travel_price_cents
	end
end
