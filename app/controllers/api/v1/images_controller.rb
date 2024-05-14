class Api::V1::ImagesController < ApplicationController

    # A felhasználó autentikációját végzi mielőtt bármilyen műveletet végrehajtana
    before_action :authenticate_user!, only: [:create, :update, :destory]

    # GET /api/v1/images
    # Visszaadja az összes képet egy JSON formátumban
    def index
        images = Image.all
        images_hash = ImageSerializer.new(images).serializable_hash[:data]
        images_attributes = images_hash.map { |image| image[:attributes].except(:filename) }
        render json: images_attributes
    end

    # GET /api/v1/images/:team_slug
    # Visszaadja az egy csapathoz tartozó összes képet egy JSON formátumban
    def show
        images = Image.where(team_slug: params[:team_slug])
        render json:ImageSerializer.new(images).serializable_hash[:data]
    end

    # POST /api/v1/images/create
    # Létrehoz egy új képet, ha nem sikerült a létrehozás, akkor hibaüzenetet ad vissza
    def create
        team = Team.find_by(slug: params[:imagesForm][:team_slug])
        image_name = params[:imagesForm][:image_name]
        team_slug = params[:imagesForm][:team_slug]
        description = params[:imagesForm][:description]
        image = Image.new(image_create_params.except(:filename))
        image.team_slug = team.slug
        image.image_name = image_name

        uploaded_file = params[:imagesForm][:image]
        filename = params[:imagesForm][:filename]
        image.image.attach(io: uploaded_file, filename: filename)
        image.image.blob.update(filename: filename)

        if image.save
          render json: { message: "Kép sikeresen hozzáadva." }, status: 200
        else
          render json: { message: "Hiba a feltöltés közben.", errors: image.errors.full_messages }, status: 422
        end
      end

    # DELETE /api/v1/images/:id
    # Törli a megadott azonosítójú képet, ha nem sikerült a törlés, akkor hibaüzenetet ad vissza
    def destroy
        @image = Image.find(params[:id])
        if @image.destroy
            render json: {message: "Kép sikeresen törölve."}, status: 200
        else
            render json: {error: image.errors.message}, status: 422
        end
    end

    # PUT /api/v1/images/:id
    # Módosítja a megadott azonosítójú képet, ha nem sikerült a módosítás, akkor hibaüzenetet ad vissza
    def update
        @image = Image.find(params[:id])

        if @image.update(image_create_params)
            render json: {message: "Kép sikeresen módosítva."}, status: 200
        else
            render json: {message:"Hiba a kép módosítása közben."}, status:422
        end
    end

    #Azt mondja meg, hogy milyen paraméterek engedélyezettek a requestben
    private
        def image_params
            params.require(:images).permit(:id,:team_slug)
        end
        def image_create_params
            params.require(:imagesForm).permit(:id,:image_name, :team_slug, :description, :image, :filename)
        end
end
