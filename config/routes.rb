Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :examples
    end
  end
  root "cars#index"
  get "/cars", to:"cars#index"
end
