class Client < ApplicationRecord
  include PgSearch
  belongs_to :family

  pg_search_scope :search_by_name, 
  				against: [:first_name, :last_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum language_level: { débutant: 0, intermédiaire: 1 }
  paginates_per 10
end
