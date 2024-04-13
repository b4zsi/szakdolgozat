class Car < ApplicationRecord
  belongs_to :team, class_name: "Team", foreign_key: "team_slug"
  has_many :images, class_name: "Image", foreign_key: "image_name",primary_key: "team_slug"

  def image_url
  Rails.application.routes.url_helpers.url_for(image) if self.image.attached?
  end

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :engine, presence: true, length: { minimum: 5, maximum: 50 }
  validates :races_won, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:24 }
  validates :pole_positions, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:24 }
  validates :podiums, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:24 }
  validates :horsepower, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fuel, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 400 }

end
