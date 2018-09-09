class AddMoney < ActiveRecord::Migration[5.1]
  def change
  	add_monetize :products, :application_fee_price_cents 
  end
end
