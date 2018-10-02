class Oliv < ActiveRecord::Migration[5.1]
  def change
    change_column :language_stays, :fee, :boolean, default: false
  end
end
