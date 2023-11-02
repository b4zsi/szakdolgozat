class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :number, :nationality, :number_of_wins, :number_of_podiums, :series_id, :description, :profile_picture, :team_id, :slug, :team_slug
  
  belongs_to :series

  def profile_picture
    # Ensure that profile_picture is base64 encoded before rendering it in JSON
    Base64.strict_encode64(object.profile_picture)
  end
end
