class Api::V1::ImagesController < ApplicationController

    before_action :authenticate_user!, only: [:create, :update, :destory]

    def index
        images = Image.all
        images_hash = ImageSerializer.new(images).serializable_hash[:data]
        images_attributes = images_hash.map { |image| image[:attributes] }
        render json: images_attributes
        puts "LOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOL".red
    end

    def show
        images = Image.where(team_slug: params[:team_slug])
        render json:ImageSerializer.new(images).serializable_hash[:data]
        puts "alsdkjhfalsjkdhflakjsdhflkajsdhf".red
    end

    def create
        team = Team.find_by(slug: params[:imagesForm][:team_slug])
        image_data = params[:imagesForm][:image_url]
        image = Image.new(image_create_params)
        image.team_slug = team.slug
        if image.save
            render json: {message: "Kép sikeresen hozzáadva."}, status: 200
        else
            render json: {message: "Hiba a feltöltés közben.",errors: image.errors.full_messages}, status: 422
        end
    end

    def destroy
        @image = Image.find(params[:id])
        if @image.destroy
            render json: {message: "Kép sikeresen törölve."}, status: 200
        else
            render json: {error: image.errors.message}, status: 422
        end
    end

    def update
        @image = Image.find(params[:id])

        if @image.update(image_create_params)
            render json: {message: "Kép sikeresen módosítva."}, status: 200
        else
            render json: {message:"Hiba a kép módosítása közben."}, status:422
        end
    end


    private
        def image_params
            params.require(:images).permit(:team_slug)
        end
        def image_create_params
            params.require(:imagesForm).permit(:id,:image_name, :team_slug, :description, :image)
        end
end
