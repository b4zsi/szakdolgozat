class Api::V1::DriversController < ApplicationController
    def index
        @drivers = Driver.all

        render json: @drivers, each_serializer: DriverSerializer
    end

    def show
        Driver.find_by(name)

        render json: DriverSerializer.new(drivers)
    end
end