class ChangePriceCents < ActiveRecord::Migration[5.1]
  def change
  	rename_column :invoices, :total_price, :total_price_cents
  end
end
