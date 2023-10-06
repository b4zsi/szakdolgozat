Rails.application.routes.draw do
  root "drivers#index"

  namespace :api do
    namespace :v1 do
      resources :series
      resources :drivers
      resources :cars
    end
  end
  
  get "*path", to:"drivers#index", via: :all
end
