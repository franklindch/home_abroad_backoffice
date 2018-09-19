class Other < ActiveRecord::Migration[5.1]
  def change
    remove_column :qualifications, :refered_by
    remove_column :qualifications, :data_entry_responsible
    remove_column :qualifications, :contact_mode
    remove_column :qualifications, :reference_name
    remove_column :qualifications, :comment
    add_column :child_details, :commercial_responsible, :integer
  end
end
