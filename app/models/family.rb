class Family < ApplicationRecord
	include PgSearch
	belongs_to :qualification, optional: true
	has_many :clients, dependent: :destroy, inverse_of: :family
	pg_search_scope :search_by_name, 
					against: [:name, :phone, :city, :address_1],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}

	enum family_situation: { Maries: 1, Divorces: 2, En_couple: 3 }
	# paginates_per 10
	# validates :name, :family_situation, :address_1, :city, :zip_code, :phone, presence: true
	# validates :phone, uniqueness: true
end