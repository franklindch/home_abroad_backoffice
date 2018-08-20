class Payment < ApplicationRecord
  belongs_to :invoice

  enum nature: { 
		Carte_de_crédit: 0, 
		Chèque: 1, 
		Virement: 2
	}
	def total
		return 
	end
end
