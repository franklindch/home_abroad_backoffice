class CreateTravelTransits < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_transits do |t|
      t.references :transit, foreign_key: true
      t.references :travel, foreign_key: true

      t.timestamps
    end
  end
end
