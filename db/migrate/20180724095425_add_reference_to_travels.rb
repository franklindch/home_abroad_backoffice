class AddReferenceToTravels < ActiveRecord::Migration[5.1]
  def change
  	add_column :travels, :reference, :string
  end
end
