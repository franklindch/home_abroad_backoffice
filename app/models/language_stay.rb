class LanguageStay < ApplicationRecord
  has_one :travel, dependent: :destroy
  belongs_to :program, optional: true
  belongs_to :client, optional: true
  belongs_to :partner_company, optional: true
  has_one :invoice, dependent: :destroy

  has_one :off_set_travel, through: :travel, dependent: :destroy
  has_many :payments, through: :invoice, dependent: :destroy

  enum data_entry_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6, Stagiaire: 7, Franklin: 8 }
  enum commercial_responsible: { Christine: 1, Jéremy: 2, Jeanne: 3, Marie: 4, Marlène: 5, Olivia: 6 }, _suffix: true
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
    Teacher_s_home: 4
  }


  validates :data_entry_responsible, :commercial_responsible, :program_id, :partner_company_id, :start_date, :end_date, :location, presence: true

  def get_duration
    s = self.start_date
    e = self.end_date
    return s.step(e, 7).count
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
