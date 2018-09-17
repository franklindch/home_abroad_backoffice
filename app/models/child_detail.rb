class ChildDetail < ApplicationRecord
	belongs_to :qualification
	# has_one :family, dependent: :destroy, through: :qualification

  has_and_belongs_to_many :partner_companies
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

  enum status: { Prospect: 0, Prospect_clôturé: 1, Client: 2, Dormant: 3 }

  # after_update :verify_family_status

  def status_to_close
    update_columns(status: 'Prospect_clôturé')
  end

  def status_to_open
    update_columns(status: 'Prospect')
  end

  # def verify_family_status
  #   self.qualification = qualification
  #   child_details = qualification.child_details.group_by { |x| x.status }
  #   binding.pry
  #   child_details.each do |value|
  #     value == 'Prospect'
  #   end

  # end
end
