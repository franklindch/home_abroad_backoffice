class Addothercolumns < ActiveRecord::Migration[5.1]
  def change
    drop_table :child_detail_language_stays
    drop_table :potential_language_stays
    add_column :clients, :status, :integer
    add_column :travel_groups, :season, :integer
    add_column :clients, :season, :integer
    remove_column :language_stays, :intl_number
    remove_column :language_stays, :activities
    remove_column :language_stays, :phone_during_stay
    add_column :language_stays, :canceled_language_stay, :boolean, default: false
    add_column :attendants, :address, :string
    add_column :attendants, :zip_code, :string
    change_column :clients, :zip_code, :string
    change_column :families, :zip_code, :string
    add_column :language_stays, :accomodation_type, :integer
    add_column :payments, :payment_date, :date
  end
end
