class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :transits_travels, :travel_id, :specific_language_stay_travel_id
  end
end
