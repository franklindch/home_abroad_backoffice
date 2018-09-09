class TravelTransit < ApplicationRecord
  belongs_to :transit
  belongs_to :travel
end
