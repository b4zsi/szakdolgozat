class Api::V1::TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks, Serializer: TrackSerializer
  end

  def show
    @track = Track.where(id: params[:id])
    render json: @track, Serializer: TrackSerializer
  end

  def create
    @track = Track.new(track_params)
    if track.valid?
      @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def update
    @track = Track.find(params[:id])
    @track.assign_attributes(track_params)
    if @track.valid?
      @track.update(track_params)
      render json: @track, status: :ok
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      render json: @track, status: :ok
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  private
        def track_params
          params.require(:track).permit(:id, :name, :country, :city, :length, :turns, :lap_record, :lap_record_in_seconds,:description)
        end
end
