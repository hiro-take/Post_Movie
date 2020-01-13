Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  resources :youtubes, only: :index
  resources :users, only: :show
  resources :movies do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end
end
