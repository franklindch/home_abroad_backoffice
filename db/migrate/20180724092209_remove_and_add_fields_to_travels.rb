class RemoveAndAddFieldsToTravels < ActiveRecord::Migration[5.1]
  def change
  	remove_column :travels, :correspondence
  	remove_column :travels, :mode
  	remove_column :travels, :reference
  	remove_column :travels, :partner_company_id
  	remove_column :travels, :start_time
  	remove_column :travels, :end_time
  	remove_column :travels, :departure_location
  	remove_column :travels, :arrival_location
  	remove_column :travels, :meeting_time
  	add_column :travels, :type, :integer
  end
end
