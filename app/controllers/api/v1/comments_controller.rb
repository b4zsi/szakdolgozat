class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments, Serializer: CommentSerializer
    end

    def show
        @comment = Comment.where(post_id: params[:post_id])
        render json: @comment, each_serializer: CommentSerializer
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: {message: "Komment sikeresen hozzáadva."}, status: 200
        else
            render json: {message: "Hiba a komment feltöltése közben.",errors: post.errors.full_messages}, status: 422
        end
    end

    def destroy

    end

    private 
        def comment_params
            params.require(:comment).permit(:body,:post_id, :author_id)
        end
        
end