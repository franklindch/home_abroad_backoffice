class Travel < ApplicationRecord
  belongs_to :language_stay, optional: true
  validates_uniqueness_of :language_stay_id
  belongs_to :travel_group, optional: true
  has_and_belongs_to_many :transits, class_name: 'Transit'
  has_one :off_set_travel, dependent: :destroy
  has_many :travel_details, dependent: :destroy, inverse_of: :travel
  has_many :correspondences, through: :travel_details, dependent: :destroy

  # accepts_nested_attributes_for :off_set_travels, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :correspondences, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :travel_details, reject_if: :all_blank, allow_destroy: true
  
  enum nature: { 
    Groupe: 0, Groupe_décalé: 1, Indépendant: 2, Individuel: 3 
  }
end
