class Api::V1::SeriesController < ApplicationController
    def index
        @series = Series.all
        
        render json: @series, each_serializer: SeriesSerializer
    end

    def show
        @series = Series.find_by(id: params[:id])
        render json: @series, serializer: SeriesSerializer
    end

    def create
        series = Series.new(series_params)
        if series.save
            render json: @series, serializer: SeriesSerializer
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    def update
        series = Series.new(series_params)
        if series.save
            render json: @series, serializer: SeriesSerializer
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    def destroy
        series = Series.new(series_params)
        if series.save
            render json: @series, serializer: SeriesSerializer
        else
            render json: {error: series.errors.message}, status: 422
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
        def set_series
            @series = Series.find_by(params[:id])
        end

    # Only allow a list of trusted parameters through.
         def series_params
             params.require(:series).permit(:id, :name)
         end

         def options
            #@options []= {inckude: %i[drivers]}
            #ez majd kesobb lesz joxd
         end
end
