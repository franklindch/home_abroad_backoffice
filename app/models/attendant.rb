class Attendant < ApplicationRecord
	include PgSearch
	has_many :travel_groups, through: :attendants_travel_groups
	has_and_belongs_to_many :travel_groups

	pg_search_scope :search_by_full_name,
					against: [:first_name, :last_name],
					using: {
						tsearch: { prefix: true, negation: true, any_word: true}
					}
	validates :first_name, :last_name, :email, presence: true
end
