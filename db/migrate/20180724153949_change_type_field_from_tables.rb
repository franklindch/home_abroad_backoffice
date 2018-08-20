class ChangeTypeFieldFromTables < ActiveRecord::Migration[5.1]
  def change
  	rename_column :travels, :type, :nature
  	rename_column :travel_details, :type, :nature
  end
end
