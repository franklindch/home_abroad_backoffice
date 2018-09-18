class Addfieldsforourmodels < ActiveRecord::Migration[5.1]
  def change
    add_column :child_details, :data_entry_responsible, :integer
    add_column :child_details, :contact_mode, :integer
    add_column :child_details, :refered_by, :integer
    add_column :child_details, :reference_name, :string
    add_column :language_stays, :program_detail, :string
  end
end
