class CreateTravelAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_agencies do |t|

      t.timestamps
    end
  end
end
