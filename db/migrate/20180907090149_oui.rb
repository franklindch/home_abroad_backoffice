class Oui < ActiveRecord::Migration[5.1]
  def change
  	rename_table :specific_language_stay_travels, :travels
  end
end
