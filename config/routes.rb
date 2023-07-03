Rails.application.routes.draw do
  resources :user_collections
  resources :user_forums
  resources :users
  resources :forums
  resources :sources
  resources :collections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get "/about", to: 'application#about'
  get "/index", to: 'collections#index'
  get "/show", to: 'collections#show'

  
end
