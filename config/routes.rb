Rails.application.routes.draw do
  root "home#top"

  resources :posts

  # Users ルーティング
  get "signup", to: "users#new", as: "signup"
  post "users", to: "users#create"
  get "about", to: "users#about"

  # Sessions ルーティング
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"

  get "up" => "rails/health#show", as: :rails_health_check
end
