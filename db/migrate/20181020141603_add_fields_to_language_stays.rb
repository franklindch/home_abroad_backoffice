class AddFieldsToLanguageStays < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :confirmation_language_stay, :boolean, default: false
  end
end
