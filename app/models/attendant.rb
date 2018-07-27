class Attendant < ApplicationRecord
	include PgSearch
	has_many :travels, dependent: :destroy

	pg_search_scope :search_by_full_name, 
					against: [:first_name, :last_name],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}
end
