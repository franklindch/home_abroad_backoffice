class CreatePotentialLanguageStays < ActiveRecord::Migration[5.1]
  def change
    create_table :potential_language_stays do |t|
      t.integer :nature
      t.string :countries
      t.string :partner_companies

      t.timestamps
    end
  end
end
