class User < ApplicationRecord
       has_many :posts, class_name: "Post"
       include Devise::JWT::RevocationStrategies::JTIMatcher

       devise :database_authenticatable, :registerable, :validatable,
              :jwt_authenticatable, jwt_revocation_strategy: self

end
