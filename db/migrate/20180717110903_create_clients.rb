class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :age_category
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :age
      t.string :email
      t.string :phone_number
      t.string :passport_number
      t.string :country_of_issue, default: 'France'
      t.string :nationality, default: 'French'
      t.integer :language_level
      t.string :preferred_hobbies
      t.string :medical_issue
      t.boolean :smoker?, default: false
      t.text :comment
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
