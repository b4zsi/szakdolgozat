class Team < ApplicationRecord
   has_many :drivers, class_name: "Driver", foreign_key: "team_id" 
   has_many :images, class_name: "Image", foreign_key: "team_slug" #honnan
   belongs_to :series, class_name: "Series", foreign_key: "series_id"
   

   before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
