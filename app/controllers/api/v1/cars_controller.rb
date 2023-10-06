module Api
  module V1
      class CarsController < ApplicationController
        def index
          @cars = Car.all

          render json: @cars
        end

        def show
          #ide kell a serailizer
          #airline = Airline.find_by
          #render json: szerializernev.new(airline).serialized_json
        end

        def create
        end

        private

        def cars_params
        #whitelist of parameters that we want to allow
        params.require(:car).permit(:brand, :loero)
        end
      end
  end
end
