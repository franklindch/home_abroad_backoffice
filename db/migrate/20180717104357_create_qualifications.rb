class CreateQualifications < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifications do |t|
    	t.text :comment
    	t.boolean :prospect?, default: true
    	t.boolean :sleeping?, default: false
    	t.boolean :client?, default: false

      t.timestamps
    end
  end
end
