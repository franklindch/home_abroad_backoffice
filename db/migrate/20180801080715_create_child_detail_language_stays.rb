class CreateChildDetailLanguageStays < ActiveRecord::Migration[5.1]
  def change
    create_table :child_detail_language_stays do |t|
      t.references :potential_language_stay, foreign_key: true
      t.references :child_detail, foreign_key: true

      t.timestamps
    end
  end
end
