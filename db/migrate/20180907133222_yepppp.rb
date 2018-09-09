class Yepppp < ActiveRecord::Migration[5.1]
  def change
  	remove_column :partner_companies, :type
  	add_column :partner_companies, :nature, :string
  end
end
