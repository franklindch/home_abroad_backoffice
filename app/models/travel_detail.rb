class TravelDetail < ApplicationRecord
  belongs_to :partner_company
  belongs_to :travel

  enum mode: { Avion: 0, Train: 1}
  enum type: { Aller: 0, Retour: 1}
end
