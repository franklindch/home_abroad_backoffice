class AddFieldsToInvoices < ActiveRecord::Migration[5.1]
  def change
  	add_column :invoices, :camp_fee_percentage, :integer
  	add_column :invoices, :camp_fee_amount_price_cents, :integer
  	add_column :invoices, :camp_fee_total_price_cents, :integer
  end
end
