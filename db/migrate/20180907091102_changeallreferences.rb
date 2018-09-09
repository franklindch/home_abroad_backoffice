class Changeallreferences < ActiveRecord::Migration[5.1]
  def change
  	rename_column :travel_details, :specific_language_stay_travel_id, :travel_id
  	rename_column :off_set_travels, :specific_language_stay_travel_id, :travel_id
  	rename_column :travel_transits, :specific_language_stay_travel_id, :travel_id
  end
end
