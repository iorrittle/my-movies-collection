Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  resources :movies, only: [:index, :new, :create, :show]
  resources :users, only: :show
end
