class Driver < ApplicationRecord
    has_one :car, class_name: "Car", foreign_key: "driver_id"
    belongs_to :series, class_name: "Series", foreign_key:"series_id"

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
