Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :users
  resources :cars
  resources :parkings
  get "homes/about"
  get '/about', to: 'homes#about'
  get '/contact', to: 'homes#contact'
  get '/info', to: 'users#instruction'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
