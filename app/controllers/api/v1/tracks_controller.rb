class Api::V1::TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks, Serializer: TrackSerializer
  end

  def show
    @track = Track.where(id: params[:id])
    render json: @track, Serializer: TrackSerializer
  end

  private
        def track_params
          params.require(:track).permit(:id, :name)
        end
end
