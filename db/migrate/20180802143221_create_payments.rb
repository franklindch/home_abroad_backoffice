class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :nature
      t.integer :amount_price_cents
      t.text :comment
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
