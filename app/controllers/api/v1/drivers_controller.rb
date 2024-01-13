class Api::V1::DriversController < ApplicationController

    def index
        drivers = Driver.all
        render json: drivers, Serializer: DriverSerializer
    end

    def show
        if (1..9).include?(params[:id].to_i)
            drivers = Driver.include(:images).(series_id: params[:id]).order(:id)
        else
            drivers = Driver.where(slug: params[:id])
        end
        render json: drivers, Serializer: DriverSerializer
    end

    def update
        @driver = Driver.find(params[:id])
        @driver.image.attach(params[:image])
        render json: @driver, status: :ok
    end

    private

    def driver_params
        params.require(:drivers).permit(:id, :slug, :image)
    end

end
