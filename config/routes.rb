Rails.application.routes.draw do
  root to: "sessions#index"
  resources :sessions, only: [:index]
  resources :users
end
