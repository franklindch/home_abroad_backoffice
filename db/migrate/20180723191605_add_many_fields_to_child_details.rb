class AddManyFieldsToChildDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :child_details, :email, :string
  	add_column :child_details, :gender, :integer
  	add_column :child_details, :school_grade, :integer
  	add_column :child_details, :school, :string
  end
end
