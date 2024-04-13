class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!, only: [:update, :destroy]
    def index
        users = User.all.order(email: :asc)
        render json: users
    end

    def show
    end


    def update
        user = User.find(params[:id])
        user.assign_attributes(user_params)
        if user.valid?
            user.update(user_params)
            render json: user
        else
            render json: {error: user.errors.full_messages}
        end
    end

    private
    def user_params
        params.require(:updatedUser).permit(:id, :banned)
    end
end
