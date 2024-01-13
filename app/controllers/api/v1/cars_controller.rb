module Api
  module V1
      class CarsController < ApplicationController
        def index
          @cars = Car.include(:images).all
          render json: @cars, Serializer: CarSerializer
        end

        def show
          @car = Car.where(id: params[:id])
          render json: @car, Serializer: CarSerializer
        end

        def create
        end

        def destroy
        end


        private
        def car_params
          params.require(:car).permit(:id)
        end
      end
  end
end
