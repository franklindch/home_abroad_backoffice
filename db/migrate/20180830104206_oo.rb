class Oo < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :intl_number, :string
  end
end
