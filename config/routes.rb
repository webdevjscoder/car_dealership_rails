Rails.application.routes.draw do
  root 'welcome#home'
  get '/welcome/:id', to: 'welcome#home', as: 'welcome'
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
