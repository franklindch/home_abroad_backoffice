class AddFieldsToQualifications < ActiveRecord::Migration[5.1]
  def change
  	add_column :qualifications, :refered_by, :string
  	add_column :qualifications, :data_entry_responsible, :string
  	add_column :qualifications, :commercial_responsible, :string
  end
end
