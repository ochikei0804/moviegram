Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :movies do
    resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
