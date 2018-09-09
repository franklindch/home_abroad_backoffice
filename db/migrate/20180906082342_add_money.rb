class AddMoney < ActiveRecord::Migration[5.1]
  def change
  	add_monetize :invoices, :application_fee_price_cents 
  end
end
