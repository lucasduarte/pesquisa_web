Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :sites
  get '/user', to: 'users#index', as: 'user'
  delete '/user/:id', to: 'users#destroy', as: 'destroy_user'
  get 'welcome/index'
  root 'welcome#index'
end
