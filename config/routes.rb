Rails.application.routes.draw do
  root to: "sessions#new", as: :sessions

  post "login", to: "sessions#create", as: :session
  
  get "signup", to: "users#new", as: :users
  
  post "signup", to: "users#create", as: :user

  get "notes", to: "notes#index", as: :notes

  resources :notes, except: :index
end
