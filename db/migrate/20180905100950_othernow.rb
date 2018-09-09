class Othernow < ActiveRecord::Migration[5.1]
  def change
  	rename_column :travel_transits, :travel_id, :specific_language_stay_travel_id
  	add_reference :travel_details, :specific_language_stay_travel, index: true
  end
end
