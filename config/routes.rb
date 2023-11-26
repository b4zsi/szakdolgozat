Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  put '/current_user', to: 'current_user#update'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "pages#index"


  namespace :api do
    namespace :v1 do
      resources :series, param: :id
      resources :drivers
      resources :cars
      resources :calendar_events
      resources :teams
      resources :images, param: :team_slug
      resources :posts
      resources :comments, param: :post_id
    end
  end
  
  get "*path", to:"pages#index", via: :all

  
end
