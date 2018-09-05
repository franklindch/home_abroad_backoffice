class Meeting < ActiveRecord::Migration[5.1]
  def change
  	add_column :travel_details, :meeting_time, :time
  end
end
