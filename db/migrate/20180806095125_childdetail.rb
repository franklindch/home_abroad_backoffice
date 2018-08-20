class Childdetail < ActiveRecord::Migration[5.1]
  def change
  	add_column :child_details, :client, :boolean
  end
end
