class Addfieldsother < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :flight, :boolean, default: false
    add_column :language_stays, :visa, :boolean, default: false
  end
end
