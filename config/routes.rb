Rails.application.routes.draw do
  resources :articles
  root "articles#index"
  get "signup", to: "users#new"
  get "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  resources :users, except: [:new]
end
