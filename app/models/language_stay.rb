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
    Without_accomodation: 1,
    With_accomodation: 2
  }
  enum pension: {
    No_meal: 1,
    Breakfast: 2,
    Semi_pension: 3,
    Full_pension: 4
  }
  enum room: {
    Simple_room: 1,
    Shared_room: 2
  }
  enum accomodation_type: {
    Host_family: 1,
    In_residence: 2,
    Summer_camp: 3,
    Teachers_home: 4
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

  def cancel
    update_columns(canceled_language_stay: true)
  end

  def reestablish
    update_columns(canceled_language_stay: false)
  end
end
