class ChangingTravelSchema < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :travels, :travel, index: true, foreign_key: true
  	rename_table :travels, :travel_groups
  	remove_column :travel_groups, :nature
  	remove_reference :travel_groups, :language_stay, index: true, foreign_key: true
  end
end
