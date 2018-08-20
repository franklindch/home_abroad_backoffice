class RemoveAttendantIdFromTravels < ActiveRecord::Migration[5.1]
  def change
  	remove_column :travels, :attendant_id, foreign_key: true
  end 
end
