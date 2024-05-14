class Api::V1::CommentsController < ApplicationController
    #A felhasználó autentikációját végzi mielőtt bármilyen műveletet végrehajtana
    before_action :authenticate_user!, only: [:create, :destroy, :update]

    # GET /api/v1/comments
    # Visszaadja az összes kommentet egy JSON formátumban
    def index
        comments = Comment.all
        render json: comments
    end

    # GET /api/v1/comments/:id
    # Visszaadja a megadott azonosítójú kommentet egy JSON formátumban
    def show
        comment = Comment.where(post_id: params[:post_id])
        render json: comment
    end

    # POST /api/v1/comments/create
    # Létrehoz egy új kommentet, ha nem sikerült a létrehozás, akkor hibaüzenetet ad vissza
    def create
        comment = Comment.new(comment_params)
        if comment.valid?
            comment.save
            render json: {message: "Komment sikeresen hozzáadva."}, status: 200
        else
            render json: {message: "Hiba a komment feltöltése közben.",errors: post.errors.full_messages}, status: 422
        end
    end

    # PUT /api/v1/comments/:id
    # Törli a megadott azonosítójú kommentet, ha nem sikerült a törlés, akkor hibaüzenetet ad vissza
    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: {message: "Komment sikeresen törölve."}, status: 200
        else
            render json: {message: "Hiba a komment törlése közben.",errors: post.errors.full_messages}, status: 422
        end
    end

    #Azt mondja meg, hogy mely paraméterek engedélyezettek a requestben
    private
        def comment_params
            params.require(:comment).permit(:body,:post_id, :author_id)
        end

end
