class AddChildDetailsRefToQualifications < ActiveRecord::Migration[5.1]
  def change
    add_reference :qualifications, :child_detail, foreign_key: true
  end
end
