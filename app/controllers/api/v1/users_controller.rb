class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
    end
end
