class ChangeManyFieldsInTheDatabase < ActiveRecord::Migration[5.1]
  def change
  	remove_column :qualifications, :commercial_responsible
  	remove_column :families, :city
  	remove_column :families, :country_of_residence
  	remove_column :partner_companies, :city
  	remove_column :partner_companies, :country_of_establishment
  	remove_column :programs, :city
  	remove_column :programs, :country_of_establishment

  	rename_column :clients, :language_level, :first_language_level
  	change_column :clients, :age_category, :string, using: 'age_category::integer'
  	add_column :clients, :address_1, :string
  	add_column :clients, :address_2, :string
  	add_column :clients, :zip_code, :integer
  	add_column :clients, :passport_expiration_date, :date
  	add_column :clients, :second_language_level, :integer
  	add_column :clients, :first_language, :integer
  	add_column :clients, :second_language, :integer
  	rename_column :clients, :smoker?, :smoker

  	add_reference :language_stays, :partner_company, foreign_key: true
  	add_column :language_stays, :phone_during_stay, :string
  	add_column :language_stays, :start_date, :date
  	add_column :language_stays, :end_date, :date
  	add_column :language_stays, :location, :string
  	add_column :language_stays, :transfer, :string
  	add_column :language_stays, :pension, :string
  	add_column :language_stays, :accomodation, :string
  	add_column :language_stays, :option_1, :string
  	add_column :language_stays, :option_2, :string
  	add_column :language_stays, :class_hours, :integer
  	add_column :language_stays, :precisions, :text

  	add_column :invoices, :transfer_price_cents, :integer
  	add_column :invoices, :option_1_price_cents, :integer
  	add_column :invoices, :option_2_price_cents, :integer
  end
end
