class Yes < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :family_identifier, :integer
    add_column :clients, :client_identifier, :integer
    add_column :families, :city, :string
    add_column :clients, :city, :string
  end
end
