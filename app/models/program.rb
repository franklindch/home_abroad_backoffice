class Program < ApplicationRecord
	include PgSearch
  has_many :language_stays, dependent: :destroy

  pg_search_scope :search_by_explicit_name, 
  				against: [:explicit_name],
  				using: {
  					tsearch: { prefix: true, negation: true, any_word: true}
  				}
  enum nature: {
  	en_famille: 0,
  	campus_d_été: 1,
  	summer_camp: 2,
  	sport_art_camp: 3,
  	adventure_trip: 4,
  	volontariat: 5,
  	enrichment_camp: 6,
    echange: 7,
    scolarité: 8,
    scolarité: 9,
    scolarité: 10,
    scolarité: 11,
    scolarité: 12,
    scolarité: 13,
  	scolarité: 8,
  }
end
