Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: 'requests#index'
  resources :requests
end
