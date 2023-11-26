class Api::V1::UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end

    def show
    end
end