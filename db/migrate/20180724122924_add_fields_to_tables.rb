class AddFieldsToTables < ActiveRecord::Migration[5.1]
  def change
  	add_column :travels, :travel_code, :string
  end
end
