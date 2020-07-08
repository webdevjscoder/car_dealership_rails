Rails.application.routes.draw do
  resources :car_models
  resources :car_makes
  root 'welcome#home'
  resources :vehicles
  resources :user_vehicles, only: [:create]
  post '/checkout', to: 'user_vehicles#checkout'
  get '/confirmation/:id', to: 'user_vehicles#confirmation', as: 'confirmation'
  get '/economical-vehicles', to: 'vehicles#economical', as: 'economical'
  get '/luxury-vehicles', to: 'vehicles#luxury', as: 'luxury'
  get '/exotic-vehicles', to: 'vehicles#exotic', as: 'exotic'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :users 
  get '/favorites-list', to: 'users#favorites', as: 'favorites'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  # Github route
  get '/auth/github', as: 'github'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  
  # Facebook route
  get '/auth/facebook', as: 'facebook'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
