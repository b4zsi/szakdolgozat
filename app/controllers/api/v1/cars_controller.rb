module Api
  module V1
      class CarsController < ApplicationController

        #A felhasználó autentikációját végzi mielőtt bármilyen műveletet végrehajtana
        before_action :authenticate_user!, only: [:create, :update, :destroy]

        # GET /api/v1/cars
        # Visszaadja az összes autót egy JSON formátumban
        def index
          @cars = Car.all
          render json: @cars, Serializer: CarSerializer
        end

        # GET /api/v1/cars/:id
        # Visszaadja a megadott azonosítójú autót egy JSON formátumban
        def show
          @car = Car.where(id: params[:id])
          render json: @car, Serializer: CarSerializer
        end

        # POST /api/v1/cars/create
        # Létrehoz egy új autót, ha nem sikerült a létrehozás, akkor hibaüzenetet ad vissza
        def create
          @car = Car.new(car_params)
          if @car.valid?
            @car.save
            render json: @car, Serializer: CarSerializer
          else
            render json: @car.errors
          end
        end

        # PUT /api/v1/cars/:id
        # Módosítja a megadott azonosítójú autót, ha nem sikerült a módosítás, akkor hibaüzenetet ad vissza
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

        # DELETE /api/v1/cars/:id
        # Törli a megadott azonosítójú autót, ha nem sikerült a törlés, akkor hibaüzenetet ad vissza
        def destroy
          @car = Car.find(params[:id])
          if @car.destroy
            render json: {message: 'Autó sikeresen törölve', status: 200}
          end
            render json: {message: 'Autó nem található', status: 404}
        end

        #Azt mondja meg, hogy mely paraméterek engedélyezettek a requestben
        private
        def car_params
          params.require(:car).permit(:id, :name, :battery, :team_slug, :images, :engine, :races_won, :pole_positions, :podiums, :horsepower, :chassis, :fuel,:description)
        end
      end
  end
end
