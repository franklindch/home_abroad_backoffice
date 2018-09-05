class CreateJoinTableTravelsAttendants < ActiveRecord::Migration[5.1]
  def change
    create_join_table :travels, :attendants do |t|
      # t.index [:travel_id, :attendant_id]
      # t.index [:attendant_id, :travel_id]
    end
  end
end
