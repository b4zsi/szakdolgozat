class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!, only: [:update, :destroy]
    def index
        users = User.all
        render json: users
    end

    def show
    end
end
