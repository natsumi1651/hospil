Rails.application.routes.draw do
  root to: 'requests#index'
  resources :requests, only: [:index, :new, :create]
end
