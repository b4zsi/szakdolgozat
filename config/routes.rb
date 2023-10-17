Rails.application.routes.draw do
  root "drivers#index"


  namespace :api do
    namespace :v1 do
      resources :series, param: :id
      resources :drivers
      resources :cars
      resources :teams
    end
  end
  
  get "*path", to:"drivers#index", via: :all

  
end
