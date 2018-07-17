class CreateChildDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :child_details do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :comment

      t.timestamps
    end
  end
end
