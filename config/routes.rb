Rails.application.routes.draw do
  devise_for :users
  resources :sites
  get 'users/index'
  get 'welcome/index'
  root 'welcome#index'
end
