class Droptable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :transits_travels
  end
end
