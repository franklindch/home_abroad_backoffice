class RemoveTableFieldsFromQualificatios < ActiveRecord::Migration[5.1]
  def change
  	remove_column :qualifications, :prospect?
  	remove_column :qualifications, :client?
  	remove_column :qualifications, :sleeping?
  end
end
