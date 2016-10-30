Rails.application.routes.draw do
  root to: "homepage#index"

  resources :homepage, only: [:index]

  resources :users, only: [:new, :create, :show] do
    resources :rewards, only: [:show]
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :show]
    resources :rewards, except: [:show]
    get "/assign-points", to: "users#assign"
    put "/assign-points", to: "users#update"
  end

  get '/login', to: "sessions#login"
  post '/login', to: "sessions#authenticate"
  delete '/logout', to: "sessions#logout"

end
