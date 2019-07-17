Rails.application.routes.draw do
  root 'welcome/index'
  get 'welcome/index'
  get 'welcome/signIn'
  get 'welcome/authentificate'
  post 'welcome/authentificate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
