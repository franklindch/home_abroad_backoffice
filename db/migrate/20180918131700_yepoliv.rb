class Yepoliv < ActiveRecord::Migration[5.1]
  def change
    remove_column :qualifications, :status
    add_column :qualifications, :prospect, :boolean, default: true
  end
end
