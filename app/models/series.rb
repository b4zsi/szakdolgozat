class Series < ApplicationRecord
    has_many :teams, class_name: "Team", foreign_key: "series_id"
    has_many :drivers

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
