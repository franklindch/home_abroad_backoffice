class Yeeeeee < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :passport_cni, :boolean, default: false
  end
end
