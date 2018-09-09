class Payment < ApplicationRecord
  belongs_to :invoice

  register_currency :eur
  monetize :amount_price_cents

  enum nature: { 
		Carte_de_crédit: 0, 
		Chèque: 1, 
		Virement: 2
	}
end
