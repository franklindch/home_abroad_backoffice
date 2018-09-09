class Anotherone < ActiveRecord::Migration[5.1]
  def change
  	rename_column :attendants_travel_groups, :travel_id, :travel_group_id
  end
end
