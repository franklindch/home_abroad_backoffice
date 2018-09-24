class ChildDetail < ApplicationRecord
  include PgSearch
	belongs_to :qualification

  pg_search_scope :search_by_first_name,
          against: [:first_name],
          using: {
            tsearch: { prefix: true, negation: true, any_word: true}
          }

  has_and_belongs_to_many :partner_companies
	enum gender: { Male: 1, Female: 2 }
	enum school_grade: { Prépa: 0, Césure: 1, Terminale: 2, Première: 3, Seconde: 4, Troisième: 5, Quatrième: 6, Cinquième: 7, Sixième: 8, Etudes_supérieures: 9 }
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
  enum refered_by: { Ami: 1, Salon: 2, Rencontre_Home_Abroad: 3, Recherche_google: 4, Rien: 4 }
  enum data_entry_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7 }
  enum contact_mode: { Appel_entrant: 1, Webcontact: 2, Par_Office: 3, Email_en_direct: 4, Visite: 5 }
  enum commercial_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6 }, _suffix: true

  enum status: { Prospect: 0, Prospect_clôturé: 1, Client: 2, Dormant: 3 }
  validates :first_name, presence: true

  def status_to_close
    update_columns(status: 'Prospect_clôturé')
  end

  def status_to_open
    update_columns(status: 'Prospect')
  end
end
