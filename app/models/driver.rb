class Driver < ApplicationRecord
    has_one_attached :image
    has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "slug"

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
    end
end
