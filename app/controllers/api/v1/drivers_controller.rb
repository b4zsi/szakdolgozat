class Api::V1::DriversController < ApplicationController

    #A felhasználó autentikációját végzi mielőtt bármilyen műveletet végrehajtana
    before_action :authenticate_user!, only: [:create, :update, :destroy]

    # GET /api/v1/drivers
    # Visszaadja az összes versenyzőt egy JSON formátumban
    def index
        drivers = Driver.all
        render json: drivers, Serializer: DriverSerializer
    end

    # GET /api/v1/drivers/:id
    # Visszaadja az egy szériához tartozó összes versenyzőt egy JSON formátumban
    def show
        if (1..9).include?(params[:id].to_i)
            drivers = Driver.where(series_id: params[:id]).order(:id)
        else
            drivers = Driver.where(slug: params[:id])
        end
        render json: drivers, Serializer: DriverSerializer
    end

    # POST /api/v1/drivers/create
    # Létrehoz egy új versenyzőt, ha nem sikerült a létrehozás, akkor hibaüzenetet ad vissza
    def create
        @driver = Driver.new(driver_create_params)
        if @driver.valid?
            @driver.save
            render json: {message: "Versenyző sikeresen hozzáadva."}, status: 200
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    # PUT /api/v1/drivers/:id
    # Módosítja a megadott azonosítójú versenyzőt, ha nem sikerült a módosítás, akkor hibaüzenetet ad vissza
    def update
        @driver = Driver.find(params[:id])
        @driver.assign_attributes(driver_create_params)
        if @driver.valid?
            @driver.update(driver_create_params)
            @driver.image.attach(params[:image])
            render json: @driver, status: :ok
        else
            render json: @driver.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/drivers/:id
    # Törli a megadott azonosítójú versenyzőt, ha nem sikerült a törlés, akkor hibaüzenetet ad vissza
    def destroy
        @driver = Driver.find(params[:id])
        if @driver.destroy
            render json: {message: "Versenyző sikeresen törölve."}, status: 201
        else
            render json: {message: "Hiba történt a törlés során."}, status: :unprocessable_entity
        end
    end

    #Visszadja a versenyzők nevét és slug paraméterét
    def nameAndSlug
        @driversName = Driver.select(:name, :slug).each
        render json: @driversName
    end

    private

    def driver_params
        params.require(:drivers).permit(:id, :slug, :image)
    end

    def driver_create_params
        params.require(:drivers).permit(:id, :name, :age, :nationality, :number, :slug,:number_of_wins, :number_of_podiums, :description, :series_id, :team_slug, :team_id, :slug)
    end

end
