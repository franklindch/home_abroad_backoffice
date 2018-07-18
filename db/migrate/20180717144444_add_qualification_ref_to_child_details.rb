class AddQualificationRefToChildDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :child_details, :qualification, foreign_key: true
  end
end
