class Team < ApplicationRecord
   has_many :drivers, class_name: "Driver", foreign_key: "team_id" 
   belongs_to :series

   before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
