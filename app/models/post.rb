class Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: 'author_id'
    has_many :comments, class_name: "Comment"

    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :body, presence: true, length: {minimum: 10, maximum: 300}
    validates :author_id, presence: true
    validates :like, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
