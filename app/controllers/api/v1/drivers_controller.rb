class Api::V1::DriversController < ApplicationController

    def index
        driver = Driver.all
        render json: drivers, each_serializer: DriverSerializer
    end

    def show
        if (1..9).include?(params[:id].to_i)
            drivers = Driver.where(series_id: params[:id]).order(:id)
        else
            drivers = Driver.where(slug: params[:id])
        end
        render json: drivers, each_serializer: DriverSerializer
    end

    private

    def driver_params
        params.require(:drivers).permit(:id, :slug)
    end

end