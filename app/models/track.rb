class Track < ApplicationRecord
  has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "slug"

  validates :name, presence: true, uniqueness: true, length: { minimum: 10, maximum: 50 }
  validates :country, presence: true, length: { minimum: 5, maximum: 50 }
  validates :city, presence: true, length: { minimum: 5, maximum: 50 }
  validates :length, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000 }, :default =>  1000
  validates :turns, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:100 }
  validates :lap_record, presence: true, length: { minimum: 5, maximum: 50 }
  validates :lap_record_in_seconds, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 100, maximum: 500 }


  def image_url
    Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
    end
end
