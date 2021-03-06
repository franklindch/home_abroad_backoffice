class LanguageStay < ApplicationRecord
  EUROPE = ['FR', 'GB',
    'IE', 'MT', 'IT',
    'DE', 'ES', 'CY', 'AT']

  has_one :travel, dependent: :destroy
  belongs_to :program, optional: true
  belongs_to :client, optional: true
  belongs_to :partner_company, optional: true

  has_one :off_set_travel, through: :travel, dependent: :destroy
  has_one :invoice, dependent: :destroy

  enum data_entry_responsible: { cdc: 1, vd: 2, oc: 3, ms: 4, mg: 5, jo: 6, stagiaire1: 7, Franklin: 8, stagiaire2: 9 }
  enum commercial_responsible: { cdc: 1, vd: 2, oc: 3, ms: 4, mg: 5, jo: 6 }, _suffix: true
  enum accomodation: {
    Without_accommodation: 1,
    With_accommodation: 2
  }
  enum pension: {
    No_meal: 1,
    Breakfast: 2,
    Half_board: 3,
    Full_board: 4
  }
  enum room: {
    Single_room: 1,
    Shared_room: 2
  }
  enum accomodation_type: {
    Host_family: 1,
    Residence: 2,
    Summer_camp: 3,
    Teacher_s_home: 4,
    Itinérant: 5
  }

  scope :ordered_by_start_date, -> { order(start_date: :asc) }
  validates :data_entry_responsible, :commercial_responsible, :program_id, :partner_company_id, :start_date, :end_date, presence: true
  after_save :fill_country_code

  def self.incomplete_files
    where(
      "picture = true OR
       family_file = true OR
       language_test = true OR
       school_notes = true OR
       junior_waiver = true OR
       medical_form = true OR
       english_cv = true OR
       um = true OR
       motivation_letter = true OR
       agreement_welcome_school = true OR
       rules_and_regulations = true OR
       teacher_reference = true OR
       visa = true OR
       flight = true OR
       passport_cni = true"
    )
  end

  def confirmation_date
    s = self.start_date
    (s - Date.today).to_i
  end

  def all_attributes?
  	attributes.each do |attr|
  		return false if self[attr].nil?
  	end
  end

  def transfers_coherence
    self.included_transfers && (self.transfer_aller || self.transfer_retour)
  end

  def cancel
    update_columns(canceled_language_stay: true)
  end

  def reestablish
    update_columns(canceled_language_stay: false)
  end

  def fill_country_code
    LanguageStay::EUROPE.include?(self.country) ? self.update_columns(country_code: '7061000') : self.update_columns(country_code: '7061100')
  end
end
