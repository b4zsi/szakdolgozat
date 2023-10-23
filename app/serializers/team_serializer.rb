class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_championships, :number_of_races, :headquarters_city, :technical_director, :first_win, :last_championship_win, :date_of_establishment, :series_id, :team_picture, :team_color, :slug

  has_many :drivers

  def team_picture
    # Ensure that profile_picture is base64 encoded before rendering it in JSON
    Base64.strict_encode64(object.team_picture)
  end
end
