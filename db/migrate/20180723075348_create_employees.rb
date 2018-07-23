class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.boolean :main_contact
      t.string :job_position
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.references :partner_company, foreign_key: true

      t.timestamps
    end
  end
end
