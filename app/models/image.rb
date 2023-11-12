class Image < ApplicationRecord
    belongs_to :team, class_name: "Team", foreign_key:"team_slug", optional: true
end
