class ImageSerializer
  include JSONAPI::Serializer
  attributes :id, :image_name, :team_slug, :description, :image_url
end
