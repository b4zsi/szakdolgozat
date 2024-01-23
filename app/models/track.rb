class Track < ApplicationRecord
  has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "slug"

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
    end
end
