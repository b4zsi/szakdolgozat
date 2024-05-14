class Image < ApplicationRecord
    has_one_attached :image
    belongs_to :team, foreign_key: "team_slug"

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end

    def filename
    end

end
