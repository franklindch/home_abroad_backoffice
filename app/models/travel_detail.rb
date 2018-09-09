class TravelDetail < ApplicationRecord
  belongs_to :partner_company, optional: true
  belongs_to :travel_group, optional: true
  belongs_to :travel, optional: true
  has_many :correspondences, dependent: :destroy

  # validates :nature, uniqueness: true
  accepts_nested_attributes_for :correspondences, reject_if: :all_blank, allow_destroy: true

  enum mode: { 
    Avion: 0, Train: 1
  }
  enum nature: { 
    Aller: 0, Retour: 1
  }

  validates :companies, presence: true, if: :not_travel_group

  def not_travel_group
  	# travel.nature != 'Groupe'
  end
end
