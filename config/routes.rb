Rails.application.routes.draw do
  resources :roles
  root 'users#index'
  devise_for :users
  resources :users
end
