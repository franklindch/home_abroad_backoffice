class ChildDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :child_details, :client
    remove_column :clients, :status
    add_column :child_details, :status, :integer
  end
end
