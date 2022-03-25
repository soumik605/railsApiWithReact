Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "api/v1/users#index"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :posts
    end
  end

  get '*path' , to: "api/v1/users#index", via: :all


end
