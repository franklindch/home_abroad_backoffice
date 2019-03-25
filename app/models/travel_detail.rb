class TravelDetail < ApplicationRecord
  belongs_to :partner_company, optional: true
  belongs_to :travel_group, optional: true
  belongs_to :travel, optional: true
  has_many :correspondences, dependent: :destroy
  enum nature: {
    Aller: 0, Retour: 1
  }

  enum mode: {
    Avion: 0, Train: 1
  }
end
