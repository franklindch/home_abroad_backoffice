class PartnerCompany < ApplicationRecord
	include PgSearch
	has_many :employees, dependent: :destroy

	pg_search_scope :search_by_name, 
					against: [:name],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}
	paginates_per 10
end
