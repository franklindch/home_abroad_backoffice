class ChangeLanguageStaysFields < ActiveRecord::Migration[5.1]
  def change
  	remove_column :programs, :address
  	remove_column :programs, :nature
  	remove_column :programs, :zip_code
  	add_column :programs, :program_code, :string
  end
end
