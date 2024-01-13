class Series < ApplicationRecord
    has_many :teams
    has_many :drivers, class_name:"Driver", foreign_key:"series_id"
    has_many :images, class_name:"Image", foreign_key:"team_slug"

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
