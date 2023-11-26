class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :body, :author_id, :like
    belongs_to :user
end