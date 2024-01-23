class User < ApplicationRecord
       has_many :posts, class_name: "Post"
       has_many :comments, class_name: "Comment"
       has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "email"


       def image_url
              Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
       end
       include Devise::JWT::RevocationStrategies::JTIMatcher

       devise :database_authenticatable, :registerable, :validatable,
              :jwt_authenticatable, jwt_revocation_strategy: self

end
