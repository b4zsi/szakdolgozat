class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image_name, :image_url, :team_slug


  def image_url
    # Ensure that profile_picture is base64 encoded before rendering it in JSON
    Base64.strict_encode64(object.image_url)
  end
end
