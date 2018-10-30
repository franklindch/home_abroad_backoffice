class AddFinalAttributesToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :language_stays, :confirmation_language_stay_date, :date
    rename_column :language_stays, :location, :city
    remove_column :language_stays, :duration
    add_column :language_stays, :duration, :decimal
  end
end
