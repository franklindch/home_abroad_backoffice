class CreateTravelAttendantsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_attendants_tables do |t|
      t.references :attendant, foreign_key: true
      t.references :travel, foreign_key: true
    end
  end
end
