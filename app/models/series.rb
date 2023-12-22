class Series < ApplicationRecord
    has_many :teams
    has_many :drivers
    has_many :images, class_name:"Image", foreign_key:"team_slug"
    has_one_attached :image

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
