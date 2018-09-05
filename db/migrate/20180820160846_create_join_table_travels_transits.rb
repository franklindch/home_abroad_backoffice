class CreateJoinTableTravelsTransits < ActiveRecord::Migration[5.1]
  def change
    create_join_table :travels, :transits do |t|
      # t.index [:travel_id, :transit_id]
      # t.index [:transit_id, :travel_id]
    end
  end
end
