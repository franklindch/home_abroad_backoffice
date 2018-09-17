class Yepaa < ActiveRecord::Migration[5.1]
  def change
    remove_column :language_stays, :transfers
    add_column :language_stays, :transfer_aller, :boolean, default: false
    add_column :language_stays, :transfer_retour, :boolean, default: false
  end
end
