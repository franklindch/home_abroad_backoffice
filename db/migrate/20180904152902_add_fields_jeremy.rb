class AddFieldsJeremy < ActiveRecord::Migration[5.1]
  def change
  	add_column :families, :mother_first_name, :string
  	add_column :families, :father_first_name, :string
  	add_column :families, :mother_office_phone, :string
  	add_column :clients, :school_grade, :integer
  	add_column :clients, :school, :string
  	change_column :language_stays, :accomodation, :integer, using: "accomodation::integer"
  	change_column :language_stays, :pension, :integer, using: "pension::integer"
  	add_column :language_stays, :room, :integer
  	add_column :partner_companies, :urgence_phone_number, :string
  end
end
