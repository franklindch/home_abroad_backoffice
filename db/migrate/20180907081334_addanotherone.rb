class Addanotherone < ActiveRecord::Migration[5.1]
  def change
  	add_reference :off_set_travels, :specific_language_stay_travel, foreign_key: true
  end
end
