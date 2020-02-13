Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:id', to: 'dynamic_pages#welcome'
  root 'dynamic_pages#home'
  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :create, :destroy]
end
