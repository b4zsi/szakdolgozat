class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_races, :number_of_drivers, :number_of_teams, :slug

  has_many :teams, serializer: TeamSeriesSerializer
  has_many :drivers, serializer: DriverSerializer
  has_many :images
end
