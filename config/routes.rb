Rails.application.routes.draw do
  root 'welcome#home'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :customers, except: [:new]
  get '/signup', to: 'customers#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
