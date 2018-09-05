class CreateTransits < ActiveRecord::Migration[5.1]
  def change
    create_table :transits do |t|
      t.integer :nature
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.string :departure_location
      t.string :arrival_location
      t.integer :mode
      t.string :reference
      t.string :partner_company

      t.timestamps
    end
  end
end
