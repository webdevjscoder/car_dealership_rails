Rails.application.routes.draw do
  resources :car_models
  resources :car_makes
  root 'welcome#home'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :users, except: [:new]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/github/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
