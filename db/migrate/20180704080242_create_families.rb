class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :name
      t.integer :family_situation
      t.string :address_1
      t.string :address_2
      t.integer :zip_code
      t.string :phone
      t.string :fax
      t.string :city

      t.timestamps
    end
  end
end
