Rails.application.routes.draw do

  root to: "welcome#home"

  get 'signin', to: "sessions#new"
  post 'signin', to: "sessions#create"
  post 'logout', to: "sessions#destroy"

  resources :attractions
  resources :users

end