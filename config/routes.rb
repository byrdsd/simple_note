Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root to: "sessions#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
end
