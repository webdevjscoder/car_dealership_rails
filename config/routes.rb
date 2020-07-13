Rails.application.routes.draw do
  resources :car_models
  resources :car_makes
  resources :drive_lines
  resources :engines
  resources :engine_types
  resources :fuel_types
  resources :transmissions
  resources :transmission_types
  resources :inventories
  root 'welcome#home'
  resources :vehicles do
    member do
      get '/confirmation/:id', to: 'user_vehicles#confirmation', as: 'confirmation'
      post '/confirmation/:id/purchase/:id', to: 'vehicles#purchase', as: 'purchase'
    end
  end
  get '/upload_image/:id', to: 'vehicles#upload_image', as: 'upload_image'
  post '/add_image/:id', to: 'vehicles#add_image', as: 'add_image'
  resources :user_vehicles, only: [:create]
  post '/remove-vehicle', to: 'user_vehicles#remove'
  post '/checkout', to: 'user_vehicles#checkout'
  get '/economical-vehicles', to: 'vehicles#economical', as: 'economical'
  get '/luxury-vehicles', to: 'vehicles#luxury', as: 'luxury'
  get '/exotic-vehicles', to: 'vehicles#exotic', as: 'exotic'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :users do
    member do
      get '/favorites-list', to: 'users#favorites', as: 'favorites'
    end
  end
  get '/users/:id/change-password', to: 'users#change_password', as: 'change_password'
  get '/users/:id/purchases', to: 'users#purchases', as: 'purchases'
  get '/admin/signup', to: 'users#new_admin'
  post '/admin/signup', to: 'users#create_admin'
  get '/admin/signin', to: 'sessions#new_admin'
  post '/admin/signin', to: 'sessions#create_admin'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
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
