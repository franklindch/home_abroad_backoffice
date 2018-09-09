class OffsetTravels < ActiveRecord::Migration[5.1]
  def change
  	remove_column :off_set_travels, :travel_detail_id
  	add_column :off_set_travels, :nature, :integer
  	add_column :off_set_travels, :mode, :integer
  	add_column :off_set_travels, :is_correspondence, :boolean, default: true
  	add_column :off_set_travels, :departure_location, :string
  	add_column :off_set_travels, :arrival_location, :string
  	add_column :off_set_travels, :start_time, :time
  	add_column :off_set_travels, :end_time, :time
  	add_column :off_set_travels, :start_date, :date
  	add_column :off_set_travels, :end_date, :date
  	add_column :off_set_travels, :meeting_time, :time
  	add_column :off_set_travels, :reference, :string
  	add_reference :off_set_travels, :partner_company, foreign_key: true
  	add_reference :correspondences, :off_set_travel, foreign_key: true
  end
end
