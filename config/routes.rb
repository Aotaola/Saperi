Rails.application.routes.draw do
  resources :sources, only: [:show, :edit, :update, :destroy]
  resources :user_collections
  resources :user_forums
  resources :users, except: [:new]
  resources :forums
  resources :collections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get "/about", to: 'application#about'
  get "/signup", to: 'users#new'
  get "/login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  
  # get "/index", to: 'collections#index'
  

  
end
