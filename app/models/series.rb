class Series < ApplicationRecord
    has_many :teams
    has_many :drivers, class_name:"Driver", foreign_key:"series_id"
    has_many :images, class_name:"Image", foreign_key:"team_slug"

    validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 50}
    validates :number_of_races, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :number_of_drivers, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :number_of_teams, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :slug, presence: true, uniqueness: true


    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
