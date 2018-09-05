class Program < ApplicationRecord
	include PgSearch
  has_many :language_stays, dependent: :destroy

  pg_search_scope :search_by_name, 
  				against: [:name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
end
