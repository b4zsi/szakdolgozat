class Api::V1::DriversController < ApplicationController
    def index
        @drivers = Driver.all

        render json: @drivers, each_serializer: DriverSerializer
    end

    def show
         drivers = Driver.where(series_id: params[:id]).order(:id)
         render json: drivers, each_serializer: DriverSerializer
    end


    private

    def driver_params
        params.require(:drivers).permit(:id)
    end

end