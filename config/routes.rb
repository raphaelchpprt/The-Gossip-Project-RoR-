Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:id', to: 'dynamic_pages#welcome'
  root 'dynamic_pages#home'
  resources :gossips
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments
  end
end
