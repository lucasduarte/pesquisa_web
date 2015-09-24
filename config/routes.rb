Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get '/search/add_alert', to: 'searches#add_alert', as: 'add_alert'
  get '/search/:search_word', to: 'searches#show', as: 'search'
  get '/user', to: 'users#index', as: 'user'
  delete '/user/:id', to: 'users#destroy', as: 'destroy_user'
  get 'welcome/index'
  get '/profile', to: 'profiles#index', as: 'user_profile'
  root 'welcome#index'
end
