class PartnerCompany < ApplicationRecord
	include PgSearch
	has_many :employees, dependent: :destroy
	has_many :travel_details, dependent: :destroy
	has_many :language_stays, dependent: :destroy

  has_and_belongs_to_many :child_details

	pg_search_scope :search_by_name,
					against: [:name],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}
	paginates_per 3000
end
