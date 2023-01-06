Rails.application.routes.draw do
  root 'homes#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  devise_for :users
  resources :users
  


  resources :cars
  resources :parkings
  get "homes/about"
  get '/about', to: 'homes#about'
  get '/contact', to: 'homes#contact'
  get '/info', to: 'users#instruction'
  # delete '/users/:id', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
