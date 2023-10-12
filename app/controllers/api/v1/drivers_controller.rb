class Api::V1::DriversController < ApplicationController
    def index
        @drivers = Driver.all

        render json: @drivers, each_serializer: DriverSerializer
    end

    def show
        @drivers = Driver.where(series_id: params[:id])
        #note to self: a find_by csak az elso elofordulast adja vissza, a where az osszeset

        render json: @drivers, each_serializer: DriverSerializer
    end


    private

    def driver_params
        params.require(:drivers).permit(:id)
    end

end