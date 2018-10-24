class Payment < ApplicationRecord
  belongs_to :invoice

  register_currency :eur
  monetize :amount_price_cents

  enum nature: {
    Stripe: 0,
    Espèces: 1,
		Carte_de_crédit: 2,
		Chèque: 3,
		Virement: 4
	}

  enum category: {
    Règlement: 0,
    Remboursement: 1
  }
end
