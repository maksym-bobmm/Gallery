Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :categories
  resources :images
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :subscriptions, only: [:create]
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
