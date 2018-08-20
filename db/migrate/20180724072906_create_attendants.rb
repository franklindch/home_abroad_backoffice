class CreateAttendants < ActiveRecord::Migration[5.1]
  def change
    create_table :attendants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
