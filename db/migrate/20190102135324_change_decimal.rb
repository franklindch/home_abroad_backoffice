class ChangeDecimal < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :amount_price_cents
    add_column :payments, :amount_price_cents, :decimal
  end
end
