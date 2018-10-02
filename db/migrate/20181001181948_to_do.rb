class ToDo < ActiveRecord::Migration[5.1]
  def change
    add_column :child_details, :birth_date, :date
    add_column :language_stays, :included_transfers, :boolean, default: false
    remove_column :travels, :u_m
    remove_column :invoices, :camp_fee_percentage
    remove_column :invoices, :camp_fee_amount_price_currency
    remove_column :invoices, :camp_fee_total_price_currency
    remove_column :invoices, :camp_fee_total_price_cents
    remove_column :invoices, :camp_fee_amount_price_cents
    add_column :travel_details, :u_m, :boolean, default: false
    change_column :off_set_travels, :is_correspondence, :boolean, default: false
    change_column :employees, :main_contact, :boolean, default: false
    change_column :off_set_travels, :is_correspondence, :boolean, default: false
    change_column :travel_details, :is_correspondence, :boolean, default: false
  end
end
