class ChangeReference < ActiveRecord::Migration[5.1]
  def change
  	rename_column :travel_details, :travel_id, :travel_group_id
  end
end
