class CreateTravelDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_details do |t|
      t.integer :nature
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.boolean :correspondence, default: false
      t.string :departure_location
      t.string :arrival_location
      t.string :reference
      t.references :partner_company, foreign_key: true
      t.references :travel, foreign_key: true

      t.timestamps
    end
  end
end
