class Codee < ActiveRecord::Migration[5.1]
  def change
    add_column :partner_companies, :code, :string
    remove_column :clients, :nationality
    add_column :clients, :nationality, :string, default: 'French'
  end
end
