class TravelAttendant < ApplicationRecord
  belongs_to :travel_group
  belongs_to :attendant
end
