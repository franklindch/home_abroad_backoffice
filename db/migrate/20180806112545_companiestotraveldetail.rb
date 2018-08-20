class Companiestotraveldetail < ActiveRecord::Migration[5.1]
  def change
  	add_column :travel_details, :companies, :string
  end
end
