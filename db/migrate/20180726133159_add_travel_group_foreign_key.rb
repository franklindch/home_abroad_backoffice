class AddTravelGroupForeignKeyy < ActiveRecord::Migration[5.1]
  def change
  	add_reference :travels, :travel, foreign_key: true
  end
end
