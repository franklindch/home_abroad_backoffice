class Travel < ApplicationRecord
  belongs_to :language_stay, optional: true
  # validates_uniqueness_of :language_stay_id
  belongs_to :travel_group, optional: true
  has_and_belongs_to_many :transits, class_name: 'Transit'
  has_one :off_set_travel, dependent: :destroy
  has_many :travel_details, dependent: :destroy, inverse_of: :travel
  has_many :correspondences, through: :travel_details, dependent: :destroy

  enum nature: {
    Groupe: 0, Groupe_décalé: 1, Indépendant: 2, Individuel: 3, Individuel_rattaché: 4
  }
end
