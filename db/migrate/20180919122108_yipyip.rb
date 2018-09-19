class Yipyip < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :gender
    add_column :clients, :gender, :integer
    add_column :language_stays, :option_1_fr, :string
    add_column :language_stays, :option_2_fr, :string
    add_column :language_stays, :program_detail_fr, :text
  end
end
