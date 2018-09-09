class Paymentmonetize < ActiveRecord::Migration[5.1]
  def change
  	remove_column :payments, :amount_price_cents
  	add_monetize :payments, :amount_price
  end
end
