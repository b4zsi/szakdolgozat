class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :city, :length, :turns, :lap_record, :lap_record_in_seconds,:description, :images, :slug

  has_many :images
end
