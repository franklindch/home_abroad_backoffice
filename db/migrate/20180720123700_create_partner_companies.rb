class CreatePartnerCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_companies do |t|
      t.string :type
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
