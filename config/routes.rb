Rails.application.routes.draw do
  # get 'item_locations/index'
  # get 'item_locations/new'
  # get 'item_locations/show'
  # get 'item_locations/edit'
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :locations
  resources :items
  resources :item_locations

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
