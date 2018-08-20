class AddCountryToFamilies < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :country_of_residence, :string
  end
end
