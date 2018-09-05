class Drop < ActiveRecord::Migration[5.1]
  def change
  	drop_table :travel_attendants_tables
  end
end
