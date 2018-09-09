class Yep < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :father_office_phone, :string
  	add_column :families, :mother_office_intl_number, :string
  	add_column :families, :father_office_intl_number, :string
  end
end
