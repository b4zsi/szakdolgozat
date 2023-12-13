class Image < ApplicationRecord
    belongs_to :team, class_name: "Team", foreign_key:"team_slug", optional: true
    has_one_attached :image

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
