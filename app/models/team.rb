class Team < ApplicationRecord
   has_many :drivers, class_name: "Driver", foreign_key: "team_id" 
end
