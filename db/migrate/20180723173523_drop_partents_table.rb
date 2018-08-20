class DropPartentsTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :parents
  end
end
