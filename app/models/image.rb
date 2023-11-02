class Image < ApplicationRecord
    belongs_to :teams, class_name: "Team", foreign_key:"team_slug"
    belongs_to :series, class_name: "Series", foreign_key:"team_slug"
end
