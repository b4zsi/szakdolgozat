class Comment < ApplicationRecord
    belongs_to :post, class_name: "Post", foreign_key: "post_id"
    belongs_to :user, class_name: "User", foreign_key: 'author_id'

    validates :body, presence: true, length: { minimum: 10, maximum: 200 }
    validates :post_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :author_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
