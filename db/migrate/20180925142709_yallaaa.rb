class Yallaaa < ActiveRecord::Migration[5.1]
  def change
    add_column :child_details, :existing_family, :boolean, default: false
    add_column :child_details, :follow_up, :integer
    add_column :qualifications, :refered_by, :integer
    add_column :families, :mother_main_contact, :boolean, default: true
    add_column :families, :father_main_contact, :boolean, default: false
    add_column :language_stays, :country, :string
    add_column :invoices, :option_3_price_cents, :integer
    add_column :invoices, :option_3_price_currency, :string
    add_column :language_stays, :option_3_fr, :string
    add_column :language_stays, :option_3, :string
    add_column :partner_companies, :country, :string
    add_column :travels, :u_m, :boolean, default: false
    rename_column :clients, :city, :country
    rename_column :families, :city, :country
  end
end
