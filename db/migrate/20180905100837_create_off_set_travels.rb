class CreateOffSetTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :off_set_travels do |t|
      t.references :travel_detail, foreign_key: true

      t.timestamps
    end
  end
end
