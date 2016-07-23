Rails.application.routes.draw do

  resources :movies do
  	resources :reviews, only: [:new, :create, :destroy]
  end

  namespace :admin do
  	resources :users, only: [:show, :index]
  end

  resources :admin, only: [:new, :create, :index]

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 