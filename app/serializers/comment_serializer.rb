class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :post_id, :author_id
  belongs_to :post
end
