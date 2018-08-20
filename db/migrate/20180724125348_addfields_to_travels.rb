class AddfieldsToTravels < ActiveRecord::Migration[5.1]
  def change
  	remove_column :travels, :reference, :string
  	add_column :travel_details, :reference, :string
  end
end
