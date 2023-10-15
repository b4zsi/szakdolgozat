class Api::V1::TeamsController < ApplicationController
    def index
        @teams = Teams.all
        
        render json: @teams, each_serializer: TeamSerializer
    end

    def show
        @teams = Teams.find_by(id: params[:id])
        render json: @teams, serializer: TeamSerializer
    end

    def create
        teams = Teams.new(teams_params)
        if teams.save
            render json: @teams, serializer: TeamSerializer
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
             params.require(:teams).permit(:id, :name)
         end

         def options
            #@options []= {inckude: %i[drivers]}
            #ez majd kesobb lesz joxd
         end
end