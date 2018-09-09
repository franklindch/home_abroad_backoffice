class Rename < ActiveRecord::Migration[5.1]
  def change
  	rename_table :attendants_travels, :attendants_travel_groups
  end
end
