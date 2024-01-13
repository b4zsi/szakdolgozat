class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_championships, :number_of_races, :headquarters_city, :technical_director, :first_win, :last_championship_win, :date_of_establishment, :series_id, :team_color, :slug, :description,:images,:cars

  has_many :drivers
  has_many :images
  has_many :cars, class_name: "Car", foreign_key: "id"
  belongs_to :series

  def first_image
    object.images.order(id: :asc).first
  end

end
