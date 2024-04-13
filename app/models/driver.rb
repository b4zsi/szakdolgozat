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

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }
    validates :slug, presence: true, length: { minimum: 5, maximum: 50 }
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 15 }
    validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }
    validates :nationality, presence: true, length: { minimum: 5, maximum: 50 }
    validates :number_of_wins, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :number_of_podiums, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :series_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
    validates :team_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :description, presence: true, length: { minimum: 50, maximum: 200 }
end
