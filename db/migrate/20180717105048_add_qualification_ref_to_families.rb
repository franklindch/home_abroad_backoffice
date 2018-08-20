class AddQualificationRefToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_reference :families, :qualification, foreign_key: true
  end
end
