class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :remember_created_at, :admin
end
