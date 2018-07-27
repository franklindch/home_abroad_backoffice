class CreateCorrespondences < ActiveRecord::Migration[5.1]
  def change
    create_table :correspondences do |t|
      t.string :reference
      t.time :start_time
      t.time :end_time
      t.string :departure_location
      t.string :arrival_location
      t.references :travel, foreign_key: true

      t.timestamps
    end
  end
end
