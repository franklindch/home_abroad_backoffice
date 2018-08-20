class RemoveFaxFromFamilies < ActiveRecord::Migration[5.1]
  def change
  	remove_column :families, :fax
  end
end
