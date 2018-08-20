class AddAcheminementToTravels < ActiveRecord::Migration[5.1]
  def change
  	add_column :travels, :acheminement, :integer
  end
end
