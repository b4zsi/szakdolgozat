class Api::V1::ImagesController < ApplicationController
    def index
        image = Image.all
        render json: image, each_serializer: ImageSerializer
    end
end
