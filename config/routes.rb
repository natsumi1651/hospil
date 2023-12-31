Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: 'requests#index'
  resources :requests do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resource :likes, only: [:create, :destroy]
  end
  resources :questions, only: [:index, :show]
end
