class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    if !current_user
      render json: {message: "Nincs bejelentkezve felhasználó."}, status: 301
    else
      render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render json: {message: "Adatok sikeresen módosítva."}, status: 200
    else
      render json: {message:"Hiba az adatok módosítása közben."}, status:422
    end
  end

  def destroy
    @user = current_user

    if @user.destroy(user_params)
      render json: {message: "Fiók sikeresen törölve."}, status: 200
    else
      render json: {message:"Hiba a fiók törlése közben."}, status:422
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :admin, :username, :keresztnev, :vezeteknev, :fav_team, :fav_driver)
  end

  def authenticate_user!
    if !current_user
      render json: {message: "Nincs bejelentkezve felhasználó."}, status: 301
    end
  end

end
