class ChangeFieldsForTables < ActiveRecord::Migration[5.1]
  def change
    change_column :invoices, :application_fee_price_cents, :decimal
    change_column :invoices, :language_stay_price_cents, :decimal
    change_column :invoices, :travel_price_cents, :decimal
    change_column :invoices, :transfer_price_cents, :decimal
    change_column :invoices, :option_1_price_cents, :decimal
    change_column :invoices, :option_2_price_cents, :decimal
    change_column :invoices, :option_3_price_cents, :decimal
    change_column :invoices, :total_price_cents, :decimal
    remove_column :language_stays, :included_transfers
    remove_column :language_stays, :parent_consent
    add_column :payments, :category, :integer
  end
end
