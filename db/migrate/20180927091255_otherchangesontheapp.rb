class Otherchangesontheapp < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :other_pension, :text
    add_column :language_stays, :other_transfer, :text
    remove_column :child_details, :existing_family
    add_column :child_details, :existing_family, :boolean, default: true
  end
end
