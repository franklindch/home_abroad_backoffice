class LanguageStay < ApplicationRecord
  has_one :travel, dependent: :destroy
  belongs_to :program, optional: true
  belongs_to :client, optional: true
  belongs_to :partner_company, optional: true
  has_one :invoice, dependent: :destroy

  has_one :off_set_travel, through: :travel, dependent: :destroy
  has_many :payments, through: :invoice, dependent: :destroy

  enum data_entry_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7 }
  enum commercial_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6 }, _suffix: true
  enum accomodation: {
    Sans_logement: 1,
    Avec_logement: 2
  }
  enum pension: {
    Sans_repas: 1,
    Petit_dej: 2,
    Demi_pension: 3,
    Pension_complète: 4
  }
  enum room: {
    Chambre_simple: 1,
    Chambre_partagée: 2
  }
  enum accomodation_type: {
    Famille_d_accueil: 1,
    En_résidence: 2,
    Chez_le_professeur: 3
  }
  validates :data_entry_responsible, :commercial_responsible, :program_id, :partner_company_id, :start_date, :end_date, :location, presence: true

  def get_duration(e, s)
    return (e.strftime("%U").to_i - s.strftime("%U").to_i)
  end

  def all_attributes?
  	attributes.each do |attr|
  		return false if self[attr].nil?
  	end
  end
end
