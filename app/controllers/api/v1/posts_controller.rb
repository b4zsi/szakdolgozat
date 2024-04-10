class Api::V1::PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def index
        post = Post.includes(:user).all.order(created_at: :desc)
        render json: post
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.new(post_params)
        if post.save
            render json: {message: "Poszt sikeresen hozzáadva."}, status: 200
        else
            render json: {message: "Hiba a poszt feltöltése közben.",errors: post.errors.full_messages}, status: 422
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            render json: {message: "Poszt sikeresen törölve."}, status: 200
        else
            render json: {error: post.errors.message}, status: 422
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            render json: {message: "Poszt sikeresen módosítva."}, status: 200
        else
            render json: {message:"Hiba a poszt módosítása közben."}, status:422
        end
    end

    private

    def post_params
        params.require(:post).permit(:id, :title, :body, :author_id, :like)
    end
end
