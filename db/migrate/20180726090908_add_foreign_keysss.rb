class AddForeignKeysss < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :invoices, :language_stays, foreign_key: true
  	remove_reference :travels, :language_stays, foreign_key: true
  	add_reference :invoices, :language_stay, foreign_key: true
  	add_reference :travels, :language_stay, foreign_key: true
  end
end
