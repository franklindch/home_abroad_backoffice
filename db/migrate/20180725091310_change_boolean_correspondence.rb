class ChangeBooleanCorrespondence < ActiveRecord::Migration[5.1]
  def change
  	rename_column :travel_details, :correspondence, :is_correspondence
  end
end
