class ForeignKey < ActiveRecord::Migration[5.1]
  def change
  	add_reference :transits_travels, :travel_group, index: true
  	remove_reference :transits_travels, :travel_group, index: true
  	remove_reference :transits_travels, :travel, index: true
  	add_reference :transits_travels, :travel, index: true
  end
end
