class Api::V1::TeamsController < ApplicationController
    before_action :set_teams, only: [:nameAndSlug]
    before_action :permit_all_parameters
    before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
        @team = Team.all
        render json: @team, each_serializer:TeamSeriesSerializer
    end

    def nameAndSlug
        @teamsName = Team.select(:name, :slug).each
        render json: @teamsName
    end

    def show
        if (1..9).include?(params[:id].to_i)
            @teams = Team.where(series_id: params[:id]).order(id: :asc)
        else
            @teams = Team.where(slug: params[:id]).order(id: :asc)

        end
        render json: @teams, Serializer:TeamSeriesSerializer
    end

    def create
        @team = Team.new(teams_create_params)
        if @team.valid?
            @team.save
            render json: @team, Serializer:TeamSerializer
        else
            render json: {message: "Hiba a csapat hozzáadása során!"}, status: 422
        end
    end

    def update
        @team = Team.find(params[:id])
        @team.assign_attributes(teams_params)
        if @team.valid?
            @team.update(teams_create_params)
        else
            render json: {error: "Hiba a csapat módosítása közben"}, status: 422
        end
        #@team.image.attach(params[:image])
        render json: @team, status: :ok
    end

    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        render json: {message: "Csapat sikeresen törölve."}, status: :ok
    end

    private

    # Use callbacks to share common setup or constraints between actions.
        def set_teams
            @teamsName = Team.select(:name, :slug, :id, :series_id)
        end

    # Only allow a list of trusted parameters through.
         def teams_params
             params.require(:teams).permit(:id, :series_id)
         end

         def teams_create_params
            params.require(:team).permit(:id, :name, :slug, :series_id, :number_of_championships, :number_of_races, :headquarters_city, :technical_director, :first_win, :last_championship_win, :date_of_establishment, :team_color, :slug, :images, :description)
         end
         def permit_all_parameters
            params.permit!
          end

         def options
            #@options []= {inckude: %i[drivers]}
         end
end
