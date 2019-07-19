Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get 'welcome/index'
  get 'welcome/signIn'
  get 'welcome/authentificate'
  post 'welcome/authentificate'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
