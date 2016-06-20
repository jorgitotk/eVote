Rails.application.routes.draw do

  devise_for :users

  root "polling_processes#index"

  resources :polling_processes

  namespace :admin do
    resources :users, only: :index
    resources :members, only: :index do
      get :generate, on: :collection
    end
    resources :voters, only: :index do
      post :import, on: :collection
    end
    resources :polling_stations, only: :index do
      post :create_station, on: :collection
    end
    root "users#index"
  end

end