class OtherMigration < ActiveRecord::Migration[5.1]
  def change
  	change_column :clients, :age_category, :integer, using: 'age_category::integer'
  	remove_reference :programs, :partner_company, foreign_key: true
  end
end
