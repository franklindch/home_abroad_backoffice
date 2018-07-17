class Family < ApplicationRecord
	include PgSearch
	belongs_to :qualification
	has_many :clients
	pg_search_scope :search_by_name, 
					against: [:name, :phone, :city, :address_1],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}

	enum family_situation: { engaged: 0, celib: 1 }
	paginates_per 10
end