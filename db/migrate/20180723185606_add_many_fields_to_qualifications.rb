class AddManyFieldsToQualifications < ActiveRecord::Migration[5.1]
  def change
  	add_column :qualifications, :contact_mode, :integer
  	add_column :qualifications, :reference_name, :string
  end
end
