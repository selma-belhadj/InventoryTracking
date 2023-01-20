Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :locations
  resources :items
  resources :item_locations

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
