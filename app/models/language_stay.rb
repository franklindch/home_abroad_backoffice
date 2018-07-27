class LanguageStay < ApplicationRecord
  has_one :travel
  belongs_to :program
  belongs_to :client
  has_one :invoice
end
