class PagesController < ApplicationController
    def index
        @drivers = Driver.all

        render json: @drivers
    end
end