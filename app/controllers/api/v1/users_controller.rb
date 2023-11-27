class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, Serializer: UserSerializer
    end

    def show
    end
end