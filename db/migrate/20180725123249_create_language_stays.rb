class CreateLanguageStays < ActiveRecord::Migration[5.1]
  def change
    create_table :language_stays do |t|
      t.integer :data_entry_responsible
      t.integer :commercial_responsible
      t.integer :duration
      t.string :activities
      t.boolean :fee
      t.references :travel, foreign_key: true
      t.references :program, foreign_key: true
      t.references :client, foreign_key: true
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
