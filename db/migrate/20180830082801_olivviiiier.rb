class Olivviiiier < ActiveRecord::Migration[5.1]
  def change
  	remove_column :attendants, :age
  	add_column :attendants, :birth_date, :date
  	remove_column :clients, :age
  	add_column :correspondences, :start_date, :date
  	add_column :correspondences, :end_date, :date
  end
end
