class ChildDetail < ApplicationRecord
	belongs_to :qualification, dependent: :destroy
	has_one :family, dependent: :destroy, through: :qualification
	has_many :child_detail_language_stays, dependent: :destroy
	has_many :potential_language_stays, through: :child_detail_language_stays

	accepts_nested_attributes_for :potential_language_stays, reject_if: :all_blank, allow_destroy: true

	enum gender: { Masculin: 1, Féminin: 2 }
	enum school_grade: { Prépa: 0, Césure: 1, Terminale: 2, Première: 3, Seconde: 4, Troisième: 5, Quatrième: 6, Cinquième: 7, Sixième: 8 }
	enum month: { 
		Janvier: 0, 
		Février: 1, 
		Mars: 2, 
		Avril: 3, 
		Mai: 4, 
		Juin: 5, 
		Juillet: 6, 
		Août: 7, 
		Septembre: 8, 
		Octobre: 9, 
		Novembre: 10, 
		Décembre: 11
	}

	validates :gender, :first_name, :last_name, :age, presence: true
end
