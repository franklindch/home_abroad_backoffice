class RemoveChildDetailIdNameFromQualification < ActiveRecord::Migration[5.1]
  def change
    remove_column :qualifications, :child_detail_id
  end
end
