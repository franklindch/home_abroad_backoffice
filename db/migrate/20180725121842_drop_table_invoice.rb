class DropTableInvoice < ActiveRecord::Migration[5.1]
  def change
  	drop_table :invoices
  end
end
