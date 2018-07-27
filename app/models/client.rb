class Client < ApplicationRecord
  include PgSearch
  belongs_to :family
  has_many :language_stays, dependent: :destroy
  has_many :travels, through: :language_stays

  pg_search_scope :search_by_full_name, 
  				against: [:first_name, :last_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum language_level: { débutant: 0, intermédiaire: 1 }
  enum gender: { Masculin: 0, Féminin: 1 }
  paginates_per 10
end
