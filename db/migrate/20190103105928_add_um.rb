class AddUm < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :um, :boolean, default: false
  end
end
