class LanguageStay < ApplicationRecord
  has_one :travel, dependent: :destroy
  belongs_to :program
  belongs_to :client
  belongs_to :partner_company
  has_one :invoice, dependent: :destroy

  def get_duration(e, s)
    return (e[:month] - s[:month]) + 12 * (e[:year] - s[:year])  
  end
end
