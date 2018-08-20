class ChangeColumnTypeToQualifications < ActiveRecord::Migration[5.1]
  def change
  	change_column :qualifications, :refered_by, :integer, using: 'refered_by::integer'
  	change_column :qualifications, :data_entry_responsible, :integer, using: 'data_entry_responsible::integer'
  	change_column :qualifications, :commercial_responsible, :integer, using: 'commercial_responsible::integer'
  end
end
