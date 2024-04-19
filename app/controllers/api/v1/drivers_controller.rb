class Api::V1::DriversController < ApplicationController

    before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
        drivers = Driver.all
        render json: drivers, Serializer: DriverSerializer
    end

    def show
        if (1..9).include?(params[:id].to_i)
            drivers = Driver.where(series_id: params[:id]).order(:id)
        else
            drivers = Driver.where(slug: params[:id])
        end
        render json: drivers, Serializer: DriverSerializer
    end

    def create
        @driver = Driver.new(driver_create_params)
        if @driver.save
            render json: {message: "Versenyző sikeresen hozzáadva."}, status: 200
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    def update
        @driver = Driver.find(params[:id])
        @driver.assign_attributes(driver_create_params)
        if @driver.valid?
            @driver.update(driver_create_params)
            @driver.image.attach(params[:image])
            render json: @driver, status: :ok
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @driver = Driver.find(params[:id])
        if @driver.destroy
            render json: {message: "Versenyző sikeresen törölve."}, status: 201
        else
            render json: {message: "Hiba történt a törlés során."}, status: :unprocessable_entity
        end
    end

    def nameAndSlug
        @driversName = Driver.select(:name, :slug).each
        render json: @driversName
    end

    private

    def driver_params
        params.require(:drivers).permit(:id, :slug, :image)
    end

    def driver_create_params
        params.require(:drivers).permit(:id, :name, :age, :nationality, :number, :slug,:number_of_wins, :number_of_podiums, :description, :series_id, :team_slug, :team_id, :slug)
    end

end
