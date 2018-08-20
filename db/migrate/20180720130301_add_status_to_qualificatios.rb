class AddStatusToQualificatios < ActiveRecord::Migration[5.1]
  def change
  	add_column :qualifications, :status, :string
  end
end
