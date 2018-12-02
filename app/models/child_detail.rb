class ChildDetail < ApplicationRecord
  include PgSearch
	belongs_to :qualification

  pg_search_scope :search_by_full_name,
          against: [:first_name, :last_name],
          using: {
            tsearch: { prefix: true, negation: true, any_word: true}
          }

  paginates_per 300
  has_and_belongs_to_many :partner_companies
	enum gender: { Male: 1, Female: 2 }
	enum school_grade: {
    CP: 0,
    CE1: 1,
    CE2: 2,
    CM1: 3,
    CM2: 4,
    Sixième: 5,
    Cinquième: 6,
    Quatrième: 7,
    Troisième: 8,
    Seconde: 9,
    Première: 10,
    Terminale: 11,
    Prépa: 12,
    Césure: 13,
    Etudes_supérieures: 14,
    Professionnel: 15
  }
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
  enum refered_by: { Ami: 1, Salon: 2, Rencontre_Home_Abroad: 3, Recherche_google: 4, Office: 5 }
  enum follow_up: { A_faire: 1, Doc_envoyé: 2, A_relancer: 3, Clôturé: 4 }
  enum data_entry_responsible: { cdc: 1, je: 2, oc: 3, ms: 4, mg: 5, jo: 6, Stagiaire: 7, Franklin: 8 }
  enum contact_mode: { Appel_entrant: 1, Webcontact: 2, Par_Office: 3, Email_en_direct: 4, Visite: 5 }
  enum commercial_responsible: { cdc: 1, je: 2, oc: 3, ms: 4, mg: 5, jo: 6 }, _suffix: true

  enum status: { Prospect: 0, Prospect_clôturé: 1, Client: 2, Dormant: 3 }
  validates :first_name, :last_name, :follow_up, presence: true

  scope :real_prospects, -> { where(state: 'Prospect_clôturé').or(ChildDetail.where(status: 'Prospect_clôturé')).order(:first_name).page params[:page] }

  after_save :prospect_clôturé

  def prospect_clôturé
    update_columns(status: 'Prospect_clôturé') if self.follow_up == 'Clôturé'
  end

  def status_to_close
    update_columns(status: 'Prospect_clôturé', follow_up: 'Clôturé')
  end

  def status_to_open
    update_columns(status: 'Prospect', follow_up: 'A_faire')
  end
end
