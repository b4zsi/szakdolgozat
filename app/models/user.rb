class User < ApplicationRecord
       has_many :posts, class_name: "Post"
       has_many :comments, class_name: "Comment"
       include Devise::JWT::RevocationStrategies::JTIMatcher

       devise :database_authenticatable, :registerable, :validatable,
              :jwt_authenticatable, jwt_revocation_strategy: self

end
