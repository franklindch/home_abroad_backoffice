class Correspondence < ApplicationRecord
  belongs_to :travel_detail, optional: true
end
