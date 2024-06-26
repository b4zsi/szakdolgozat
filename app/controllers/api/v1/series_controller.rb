class Api::V1::SeriesController < ApplicationController
    def index
        series = Series.all
        render json: series, each_serializer: SeriesSerializer
    end

    def show
        if (1..9).include?(params[:id].to_i)
            @series = Series.includes(drivers: :images).find_by(id: params[:id])
        else
            @series = Series.includes(drivers: :images).where(slug: params[:id])
        end
        render json: @series, Serializer: SeriesSerializer
    end

    def create
        series = Series.new(series_params)

        if series.valid?
            series.save
            render json: series
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    def update
        series = Series.new(series_params)
        series.assign_attributes(series_params)
        if series.valid?
            series.save
            render json: series
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    def destroy
        series = Series.find(params[:id])
        if series.destroy
            render json: series
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    def nameAndId
        @seriesName = Series.select(:name, :id).each
        render json: @seriesName
    end

    private


    # Use callbacks to share common setup or constraints between actions.
        def set_series
            @series = Series.find_by(params[:id])
        end

    # Only allow a list of trusted parameters through.
         def series_params
             params.require(:series).permit(:id, :slug)
         end

         def options
            #@options []= {inckude: %i[drivers]}

         end
end
