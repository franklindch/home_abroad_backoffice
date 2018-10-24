class Category < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :category
    add_column :payments, :category, :integer
  end
end
