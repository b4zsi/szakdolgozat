class User < ApplicationRecord
       has_many :posts, class_name: "Post"
       has_many :comments, class_name: "Comment"
       has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "email"

       validates :email, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
       validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
       validates :keresztnev, presence: true, length: { minimum: 5, maximum: 50 }
       validates :vezeteknev, presence: true, length: { minimum: 5, maximum: 50 }
       validates :fav_team, presence: true, length: { minimum: 5, maximum: 50 }
       validates :fav_driver, presence: true, length: { minimum: 5, maximum: 50 }
       validates :banned, presence: true, :default => false
       validates :images, presence: false

       def image_url
              Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
       end
       include Devise::JWT::RevocationStrategies::JTIMatcher

       devise :database_authenticatable, :registerable, :validatable,
              :jwt_authenticatable, jwt_revocation_strategy: self

end
