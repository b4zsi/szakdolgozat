Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  put '/current_user', to: 'current_user#update'
  put '/api/v1/users/:id', to: 'api/v1/users#update'
  put '/api/v1/tracks/:id', to: 'api/v1/tracks#update'
  delete 'api/v1/images/:id', to: 'api/v1/images#destroy'
  delete 'api/v1/likes/:id', to: 'api/v1/likes#destroy'
  delete "api/v1/comments/:id", to: "api/v1/comments#destroy"
  get 'api/v1/teams/nameAndSlug', to: 'api/v1/teams#nameAndSlug'
  get 'api/v1/drivers/nameAndSlug', to: 'api/v1/drivers#nameAndSlug'
  get 'api/v1/series/nameAndId', to: 'api/v1/series#nameAndId'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :series, param: :id
      resources :drivers
      resources :cars, param: :id
      resources :tracks, param: :id
      resources :calendar_events
      resources :teams
      resources :images,only: [:index, :show, :create], param: :team_slug
      resources :images, only: [:destroy]
      resources :posts
      resources :comments, param: :post_id
      resources :likes
      resources :users
    end
  end


end
