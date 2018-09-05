class ChangeDefaultValueOfCorrespondence < ActiveRecord::Migration[5.1]
  def change
  	change_column :travel_details, :is_correspondence, :boolean, default: :true
  end
end
