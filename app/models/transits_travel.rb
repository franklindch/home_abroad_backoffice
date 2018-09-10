class TransitsTravel < ApplicationRecord
  belongs_to :transit
  belongs_to :travel, class_name: 'Travel'
end
