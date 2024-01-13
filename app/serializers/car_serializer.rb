class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :battery, :team_slug, :images, :engine, :races_won, :pole_positions, :podiums, :horsepower, :chassis, :fuel,:description

  belongs_to :team
  has_many :images
end
