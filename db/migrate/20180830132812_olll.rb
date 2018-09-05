class Olll < ActiveRecord::Migration[5.1]
  def change
  	remove_column :clients, :nationality
  	add_column :clients, :nationality, :string, default: 'Française'
  end
end
