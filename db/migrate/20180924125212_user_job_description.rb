class UserJobDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :job_description, :text

  end
end
