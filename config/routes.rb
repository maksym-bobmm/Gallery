Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :categories
  resources :images
  resources :comments
  resources :likes, only: [:create]
  resources :category_subscriptions, only: [:create]
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
