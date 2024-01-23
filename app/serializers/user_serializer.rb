class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :admin, :username, :keresztnev, :vezeteknev, :fav_team, :fav_driver, :banned,:images

end
