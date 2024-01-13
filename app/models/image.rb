class Image < ApplicationRecord
    has_one_attached :image
    has_one :teams, class_name: "teams", foreign_key: "team_slug"

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
