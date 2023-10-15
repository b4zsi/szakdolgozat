class Series < ApplicationRecord
    has_many :teams, class_name: "Team", foreign_key: "series_id"
    has_many :drivers
end
