Rails.application.routes.draw do
  devise_for :users, sign_out_via: :delete
  root "cars#index"


  namespace :api do
    namespace :v1 do
      resources :series, param: :id
      resources :drivers
      resources :cars
      resources :teams
      resources :images, param: :team_slug
    end
  end
  
  get "*path", to:"cars#index", via: :all

  
end
