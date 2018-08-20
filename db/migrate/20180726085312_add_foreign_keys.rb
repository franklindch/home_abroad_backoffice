class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
  	add_reference :invoices, :language_stays, foreign_key: true
  	add_reference :travels, :language_stays, foreign_key: true
  	remove_reference :language_stays, :invoice, foreign_key: true
  	remove_reference :language_stays, :travel, foreign_key: true
  end
end
