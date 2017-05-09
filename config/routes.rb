Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :nodes
  resources :places
  resources :images
  resources :cities
  resources :states
  resources :countries
  resources :regions
  resources :user_regions
  resources :user_roles
  devise_for :users
  resources :companies
  resources :managers
  root'companies#index'
  get 'get_states' => "states#get_states"
  get 'get_cities' => "cities#get_cities"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
