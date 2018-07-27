class Invoice < ApplicationRecord
	monetize :application_fee_price_cents
	monetize :language_stay_price_cents
	monetize :travel_price_cents
	monetize :total_price, as: 'total'
	belongs_to :language_stay

	# def total
	#   return application_fee_price_cents + language_stay_price_cents + travel_price_cents
	# end
end
