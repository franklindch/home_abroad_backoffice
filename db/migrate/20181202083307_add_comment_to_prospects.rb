class AddCommentToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :child_details, :ls_comments, :text
  end
end
