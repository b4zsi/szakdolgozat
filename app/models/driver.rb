class Driver < ApplicationRecord
    has_one :car, class_name: "Car", foreign_key: "driver_id"
    belongs_to :series, class_name: "Series", foreign_key:"series_id"
    has_one_attached :image

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end

    def image_url
        Rails.application.routes.url_helpers.url_for(image)
    end
end
