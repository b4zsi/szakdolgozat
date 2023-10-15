class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_races, :number_of_drivers, :number_of_teams

  has_many :teams
  has_many :drivers
end
