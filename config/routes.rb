Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :pages
  resources :articles
  get "signup", to: "users#new"

  resources :users, except: [:new] do
    resources :follows, only: [:create, :destroy]
  end

  get '/:user_id/followers', to: 'follows#follower_users', as: 'follower_users'
  get '/:user_id/followings', to: 'follows#following_users', as: 'followings_users'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]

  resources :add, only: [:new, :create]
  # post '/follows', to: 'follows#create', as: 'follow'
  # delete '/follows', to: 'follows#destroy', as: 'delete_follow'
  #resources :follows, only: [:create, :destroy]
  post 'add/new', to: 'add#create'
end

