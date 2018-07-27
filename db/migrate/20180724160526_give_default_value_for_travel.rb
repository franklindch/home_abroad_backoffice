class GiveDefaultValueForTravel < ActiveRecord::Migration[5.1]
  def change
  	change_column :travels, :nature, :integer, default: 0
  end
end
