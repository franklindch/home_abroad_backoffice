class Mode < ActiveRecord::Migration[5.1]
  def change
  	add_column :travel_details, :mode, :integer
  end
end
