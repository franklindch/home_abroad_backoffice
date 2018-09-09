class Changetransfercolumns < ActiveRecord::Migration[5.1]
  def change
  	change_column :language_stays, :transfer, :string
  end
end
