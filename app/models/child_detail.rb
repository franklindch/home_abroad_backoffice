class ChildDetail < ApplicationRecord
	belongs_to :qualification
	has_one :family, through: :qualification
	enum gender: { Masculin: 1, Féminin: 2 }
	enum school_grade: { Prépa: 0, Césure: 1, Terminale: 2, Première: 3, Seconnde: 4, Troisième: 5, Quatrième: 6, Cinquième: 7, Sixième: 8 }
end
