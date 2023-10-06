class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_championships, :number_of_races, :headquarters_city, :technical_director, :first_win, :last_championship_win, :date_of_establishment

  has_many :drivers
end
