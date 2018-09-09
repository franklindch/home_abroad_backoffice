class Transit < ActiveRecord::Migration[5.1]
  def change
  	rename_table :travel_transits, :transits_travels
  end
end
