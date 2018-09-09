class Changetransfercolumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :language_stays, :transfer, :integer, using: 'transfer::integer'
  end
end
