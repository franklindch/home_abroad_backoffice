class AddTable < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :travels,  :attendant, index: true
  end
end
