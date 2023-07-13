Rails.application.routes.draw do
  resources :sources, only: [:show, :index, :new, :edit, :update, :create, :destroy]
  resources :user_forums, only: [:show, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :forums, only: [:create, :destroy, :show]
  resources :collections do
    resources :user_collections
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get '/about', to: 'application#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  

  
end
