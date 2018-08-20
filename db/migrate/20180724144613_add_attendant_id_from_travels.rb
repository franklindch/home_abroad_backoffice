class AddAttendantIdFromTravels < ActiveRecord::Migration[5.1]
  def change
  	add_reference :travels, :attendant, foreign_key: true
  end
end
