# frozen_string_literal: true

Rails.application.routes.draw do
  require 'resque/server'
  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',
                                              confirmations: 'users/confirmations' }
  resources :categories
  resources :images
  resources :comments
  resources :likes,         only: %i[create destroy]
  resources :subscriptions, only: %i[create destroy]
  resource  :locales,       only: %i[update]
  root 'welcome#index'
  mount Resque::Server.new, at: '/resque'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
