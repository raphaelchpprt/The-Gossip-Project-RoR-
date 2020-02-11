Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:id', to: 'dynamic_pages#welcome'
  root 'dynamic_pages#home'
  get '/gossip/:id', to: 'dynamic_pages#gossip_show', as: 'gossip_show'
  get '/user/:id', to: 'dynamic_pages#user_show', as: 'user_show'
  resources :gossips, only: [:new, :create]
end
