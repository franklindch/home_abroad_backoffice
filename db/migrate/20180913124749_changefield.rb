class Changefield < ActiveRecord::Migration[5.1]
  def change
    remove_column :families, :prospect
  end
end
