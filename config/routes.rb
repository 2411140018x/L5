Rails.application.routes.draw do
  root "top#main"
  post "top/login"
  get "top/logout"

  resources :users, only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end