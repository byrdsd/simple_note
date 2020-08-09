Rails.application.routes.draw do
  root to: "sessions#new", as: :sessions

  post "login", to: "sessions#create", as: :session
  
  get "signup", to: "users#new", as: :users
  
  post "signup", to: "users#create", as: :user
  
  get "welcome", to: "sessions#welcome", as: :welcome
end
