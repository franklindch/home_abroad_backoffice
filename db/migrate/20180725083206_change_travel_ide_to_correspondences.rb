class ChangeTravelIdeToCorrespondences < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :correspondences, :travel, foreign_key: true
  	add_reference :correspondences, :travel_detail, foreign_key: true
  end
end
