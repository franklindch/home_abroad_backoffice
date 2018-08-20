class PotentialLanguageStay < ApplicationRecord
	has_many :child_details, through: :child_detail_language_stays

	 enum nature: {
  	en_famille: 0,
  	campus_d_été: 1,
  	summer_camp: 2,
  	sport_art_camp: 3,
  	adventure_trip: 4,
  	volontariat: 5,
  	enrichment_camp: 6,
    echange: 7,
    scolarité: 8
  }
end
