class Addmigrations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :travels, :acheminement
  end
end
