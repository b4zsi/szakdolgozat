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
          @car = Car.new(car_params)
          if @car.valid?
            @car.save
            render json: @car, Serializer: CarSerializer
          else
            render json: @car.errors
          end
        end

        def update
          @car = Car.find(params[:id])
          @car.assign_attributes(car_params)
          if car.valid?
            @car.update(car_params)
            render json: @car, Serializer: CarSerializer
          else
            render json: @car.errors
          end
        end

        def destroy
          @car = Car.find(params[:id])
          if @car.destroy
            render json: {message: 'Autó sikeresen törölve', status: 200}
          end
            render json: {message: 'Autó nem található', status: 404}
        end

        private
        def car_params
          params.require(:car).permit(:id, :name, :battery, :team_slug, :images, :engine, :races_won, :pole_positions, :podiums, :horsepower, :chassis, :fuel,:description)
        end
      end
  end
end
