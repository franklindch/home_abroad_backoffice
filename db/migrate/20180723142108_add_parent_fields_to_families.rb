class AddParentFieldsToFamilies < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :father_name, :string
  	add_column :families, :mother_name, :string
  	add_column :families, :mother_phone, :string
  	add_column :families, :father_phone, :string
  	add_column :families, :mother_email, :string
  	add_column :families, :father_email, :string
  end
end
