class CreateSpecificLanguageStayTravels < ActiveRecord::Migration[5.1]
  def change
    create_table :specific_language_stay_travels do |t|
      t.integer :nature
      t.references :language_stay, foreign_key: true
      t.references :travel_group, foreign_key: true

      t.timestamps
    end
  end
end
