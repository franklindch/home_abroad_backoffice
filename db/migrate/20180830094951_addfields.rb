class Addfields < ActiveRecord::Migration[5.1]
  def change
  	add_column :partner_companies, :intl_number, :string
  	add_column :clients, :intl_number, :string
  	add_column :employees, :intl_number, :string
  	add_column :families, :mother_intl_number, :string
  	add_column :families, :father_intl_number, :string
  	add_column :language_stays, :intl_number, :string
  end
end
