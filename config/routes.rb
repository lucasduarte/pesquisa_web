Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :sites
  get '/search/:search_word', to: 'searches#show', as: 'search'
  get '/user', to: 'users#index', as: 'user'
  delete '/user/:id', to: 'users#destroy', as: 'destroy_user'
  get 'welcome/index'
  root 'welcome#index'
end
