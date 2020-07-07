Rails.application.routes.draw do
  resources :car_models
  resources :car_makes
  root 'welcome#home'
  resources :vehicles
  get '/economical-vehicles', to: 'vehicles#economical', as: 'economical'
  get '/luxury-vehicles', to: 'vehicles#luxury', as: 'luxury'
  get '/exotic-vehicles', to: 'vehicles#exotic', as: 'exotic'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :users 
  get '/favorites-list', to: 'users#favorites', as: 'favorites'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Github route
  get '/auth/github/callback', to: 'sessions#create'
  
  # Facebook route
  # get '/auth/facebook/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
