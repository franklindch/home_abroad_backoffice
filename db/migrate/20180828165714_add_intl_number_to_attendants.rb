class AddIntlNumberToAttendants < ActiveRecord::Migration[5.1]
  def change
  	add_column :attendants, :intl_number, :string
  end
end
