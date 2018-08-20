class FIeldsForChildDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :child_details, :duration, :integer
  	add_column :child_details, :month, :integer
  end
end
