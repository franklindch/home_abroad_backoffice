class ChangeCountryFields < ActiveRecord::Migration[5.1]
  def change
  	rename_column :partner_companies, :country, :country_of_establishment
  end
end
