class Api::V1::LikesController < ApplicationController

  #GET /api/v1/likes

  def show
    @likes = Like.all
    render json: @likes
  end

  def create
    @like = Like.new(like_params)

    if  @like.valid?
      @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
