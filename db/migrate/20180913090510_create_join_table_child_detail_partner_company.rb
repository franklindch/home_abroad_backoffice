class CreateJoinTableChildDetailPartnerCompany < ActiveRecord::Migration[5.1]
  def change
    create_join_table :child_details, :partner_companies do |t|
      # t.index [:child_detail_id, :partner_company_id]
      # t.index [:partner_company_id, :child_detail_id]
    end
  end
end
