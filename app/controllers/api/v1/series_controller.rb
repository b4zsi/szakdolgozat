class Api::V1::SeriesController < ApplicationController
    before_action :set_series
    def index
        @series = Series.all
        
        render json: @series, each_serializer: SeriesSerializer
    end

    def show
        render json: @example, serializer: SeriesSerializer
    end

    private
    # Use callbacks to share common setup or constraints between actions.
        def set_series
            @series = Example.find(params[:id])
        end

    # Only allow a list of trusted parameters through.
        def series_params
            params.require(:series).permit(:id, :name)
        end
            end
