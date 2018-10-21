class Yeeeeee < ActiveRecord::Migration[5.1]
  def change
    remove_column :language_stays, :passport_cni, :boolean
    add_column :language_stays, :passport_cni, :boolean, default: false
  end
end
