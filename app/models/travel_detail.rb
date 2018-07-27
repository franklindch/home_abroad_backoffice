class TravelDetail < ApplicationRecord
  belongs_to :partner_company, optional: true
  belongs_to :travel
  has_many :correspondences

  # validates :nature, uniqueness: true
  accepts_nested_attributes_for :correspondences, reject_if: :all_blank, allow_destroy: true

  enum mode: { Avion: 0, Train: 1}
  enum nature: { Aller: 0, Retour: 1}
end