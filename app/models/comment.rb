class Comment < ApplicationRecord
    belongs_to :post, class_name: "Post", foreign_key: "post_id"
    belongs_to :user, class_name: "User", foreign_key: 'author_id'
end
