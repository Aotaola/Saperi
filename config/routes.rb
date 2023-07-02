Rails.application.routes.draw do
  resources :userswithcollections
  resources :forums
  resources :sources
  resources :collections
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
