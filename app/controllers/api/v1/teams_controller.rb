class Api::V1::TeamsController < ApplicationController
    def index
        team = Team.all
        render json: team, each_serializer: TeamSerializer
    end

    def show
        teams = Team.where(series_id: params[:id]).order(:id)
        render json: teams, each_serializer: TeamSerializer
    end

    def create
        teams = Teams.new(teams_params)
        if teams.save
            render json: @teams, Serializer: TeamSerializer
        else
            render json: {error: teams.errors.message}, status: 422
        end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
        def set_teams
            @teams = Teams.find_by(params[:id])
        end

    # Only allow a list of trusted parameters through.
         def teams_params
             params.require(:teams).permit(:id, :series_id)
         end

         def options
            #@options []= {inckude: %i[drivers]}
            #ez majd kesobb lesz joxd
         end
end