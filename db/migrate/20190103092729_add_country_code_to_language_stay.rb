class AddCountryCodeToLanguageStay < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :country_code, :string
  end
end
