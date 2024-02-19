class Team < ApplicationRecord
   has_many :drivers, class_name: "Driver", foreign_key: "team_id"
   has_many :images, class_name: "Image", foreign_key: "image_name", primary_key: "slug"
   belongs_to :series, class_name: "Series", foreign_key: "series_id", optional: true

   has_many :cars, class_name: "Car",foreign_key: "id"

   def to_param
    slug
  end

  def first_image
    images.order(:id)
end


   before_create :slugify

    def slugify
        self.slug = name.parameterize
    end

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
    end
end
