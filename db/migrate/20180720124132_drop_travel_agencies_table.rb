class DropTravelAgenciesTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :travel_agencies
  end
end
