class CreateTravelAttendants < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_attendants do |t|
      t.references :travel, foreign_key: true
      t.references :attendant, foreign_key: true

      t.timestamps
    end
  end
end
