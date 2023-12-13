class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_championships, :number_of_races, :headquarters_city, :technical_director, :first_win, :last_championship_win, :date_of_establishment, :series_id, :team_color, :slug, :description

  has_many :drivers
  has_many :images
  belongs_to :series

end
