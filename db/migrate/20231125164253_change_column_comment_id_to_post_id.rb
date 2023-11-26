class ChangeColumnCommentIdToPostId < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :comment_id, :post_id
  end
end
