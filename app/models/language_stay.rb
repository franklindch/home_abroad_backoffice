class LanguageStay < ApplicationRecord
  has_many :travels, dependent: :destroy
  belongs_to :program
  belongs_to :client
  belongs_to :partner_company
  has_one :invoice, dependent: :destroy

  validates :data_entry_responsible, :commercial_responsible, :program_id, :partner_company_id, :start_date, :end_date, :location, presence: true

  def get_duration(e, s)
    return (e[:month] - s[:month]) + 12 * (e[:year] - s[:year])  
  end

  def all_attributes?
  	attributes.each do |attr|
  		return false if self[attr].nil?
  	end
  end
end
