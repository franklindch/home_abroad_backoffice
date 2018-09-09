class ChangeTravelTransitsToSpecificLanguageStayTravelsTransits < ActiveRecord::Migration[5.1]
  def change
  	rename_table :travel_transits, specific_language_stay_travels_transits
  end
end
