class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.integer :nature
      t.string :explicit_name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country_of_establishment
      t.references :partner_company, foreign_key: true

      t.timestamps
    end
  end
end
