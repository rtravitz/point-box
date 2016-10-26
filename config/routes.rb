Rails.application.routes.draw do
  root to: "homepage#index"
  resources :homepage, only: [:index]
  resources :users, only: [:new, :create, :show]
  resources :rewards, except: [:show]

  get '/login', to: "sessions#login"
  post '/login', to: "sessions#authenticate"
  delete '/logout', to: "sessions#logout"
end
