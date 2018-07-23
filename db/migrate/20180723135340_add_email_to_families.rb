class AddEmailToFamilies < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :email, :string
  end
end
