class IntlPhone < ActiveRecord::Migration[5.1]
  def change
  	add_column :partner_companies, :urgence_intl_phone_number, :string
  end
end
