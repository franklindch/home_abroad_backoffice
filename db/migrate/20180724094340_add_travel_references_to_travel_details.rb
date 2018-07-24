class AddTravelReferencesToTravelDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :travel_details, :travel, foreign_key: true
  end
end
