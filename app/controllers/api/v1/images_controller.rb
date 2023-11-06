class Api::V1::ImagesController < ApplicationController
    def index
        @image = Image.all
        render json: @image, Serializer: ImageSerializer
    end

    def show
        images = Image.where(team_slug: params[:team_slug])
        render json: images, each_serializer: ImageSerializer

    end


    private
        def image_params
            params.require(:images).permit(:team_slug)
        end
end
