class Changename < ActiveRecord::Migration[5.1]
  def change
  	rename_column :programs, :explicit_name, :name
  end
end
