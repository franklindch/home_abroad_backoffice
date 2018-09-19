class Opop < ActiveRecord::Migration[5.1]
  def change
    add_column :qualifications, :family_comment, :text
  end
end
