class Travel < ApplicationRecord
	include PgSearch
  # belongs_to :attendants, through: :attendants_travel
  has_many :travel_details, dependent: :destroy
  has_many :attendants, through: :travel_attendants
  belongs_to :attendant
  accepts_nested_attributes_for :travel_details, reject_if: :all_blank, allow_destroy: true


  pg_search_scope :search_by_reference, 
  				against: [:reference],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum type: { Groupe_décalé: 0, Pre_acheminement: 1, Post_acheminement: 2, Indépendant: 3, Individuel: 4 }
end
