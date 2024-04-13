class Like < ApplicationRecord

  validates :user_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :post_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
