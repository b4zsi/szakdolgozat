class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :number, :nationality, :number_of_wins, :number_of_podiums, :series_id
end
