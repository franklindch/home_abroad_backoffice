class Correspondence < ApplicationRecord
  belongs_to :travel_detail, optional: true
  belongs_to :off_set_travel, optional: true
end
