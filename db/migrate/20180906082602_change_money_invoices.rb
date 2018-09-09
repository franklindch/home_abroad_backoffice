class ChangeMoneyInvoices < ActiveRecord::Migration[5.1]
  def change
  	remove_column :invoices, :application_fee_price_cents
  	remove_column :invoices, :language_stay_price_cents
  	remove_column :invoices, :travel_price_cents
  	remove_column :invoices, :transfer_price_cents
  	remove_column :invoices, :option_1_price_cents
  	remove_column :invoices, :option_2_price_cents
  	remove_column :invoices, :camp_fee_amount_price_cents
  	remove_column :invoices, :camp_fee_total_price_cents
  	remove_column :invoices, :total_price_cents
  	remove_column :invoices, :application_fee_price_cents_cents
  	remove_column :invoices, :application_fee_price_cents_currency

  	add_monetize :invoices, :application_fee_price
  	add_monetize :invoices, :language_stay_price
  	add_monetize :invoices, :travel_price
  	add_monetize :invoices, :transfer_price
  	add_monetize :invoices, :option_1_price
  	add_monetize :invoices, :option_2_price
  	add_monetize :invoices, :camp_fee_amount_price
  	add_monetize :invoices, :camp_fee_total_price
  	add_monetize :invoices, :total_price
  	# add_monetize :invoices, :application_fee_price
  end
end
