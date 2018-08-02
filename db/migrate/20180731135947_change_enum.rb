class ChangeEnum < ActiveRecord::Migration[5.1]
  def change
  	change_column :qualifications, :status, :integer, using: 'status::integer'
  end
end
