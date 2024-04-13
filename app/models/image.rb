class Image < ApplicationRecord
    has_one_attached :image
    has_one :teams, class_name: "teams", foreign_key: "team_slug"

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }
    validates :team_slug, presence: true, length: { minimum: 5, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 100 }
end
