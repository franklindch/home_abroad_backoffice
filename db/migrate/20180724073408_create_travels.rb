class CreateTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :travels do |t|
      t.boolean :correspondence
      t.integer :mode
      t.integer :capacity
      t.string :reference
      t.time :start_time
      t.time :end_time
      t.string :departure_location
      t.string :arrival_location
      t.time :meeting_time
      t.references :attendant, foreign_key: true
      t.references :partner_company, foreign_key: true

      t.timestamps
    end
  end
end
