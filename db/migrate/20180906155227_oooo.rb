class Oooo < ActiveRecord::Migration[5.1]
  def change
  	remove_column :language_stays, :transfer
  	add_column :language_stays, :transfers, :text, array:true, default: []
  end
end
