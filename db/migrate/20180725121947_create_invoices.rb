class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :application_fee_price_cents
      t.integer :language_stay_price_cents
      t.integer :travel_price_cents
      t.integer :total_price

      t.timestamps
    end
  end
end
