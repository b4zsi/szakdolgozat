class Api::V1::DriversController < ApplicationController

    def index
        drivers = Driver.all
        render json: drivers
    end

    def show
        if (1..9).include?(params[:id].to_i)
            drivers = Driver.where(series_id: params[:id]).order(:id)
        else
            drivers = Driver.where(slug: params[:id])
        end
        render json: drivers
    end

    private

    def driver_params
        params.require(:drivers).permit(:id, :slug)
    end

end
