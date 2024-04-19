class Team < ApplicationRecord
    has_many :drivers, class_name: "Driver", foreign_key: "team_id"
    has_many :images, class_name: "Image", foreign_key: "image_name", primary_key: "slug"
    belongs_to :series, class_name: "Series", foreign_key: "series_id", optional: true

    validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
    validates :number_of_championships, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :number_of_races , presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :headquarters_city, presence: true, length: { minimum: 5, maximum: 50 }
    validates :technical_director, presence: true, length: { minimum: 5, maximum: 50 }
    validates :first_win, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1950, less_than_or_equal_to: 2023 }
    validates :last_championship_win, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1950, less_than_or_equal_to: 2023}
    validates :date_of_establishment, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1950, less_than_or_equal_to: 2023 }
    validates :series_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4 }
    validates :team_color, presence: true
    validates :team_id, presence: true
    validates :description, presence: true, length: { minimum: 2, maximum: 500 }

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
