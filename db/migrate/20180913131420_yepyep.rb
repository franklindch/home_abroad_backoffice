class Yepyep < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :prospect, :boolean, default: false
  end
end
