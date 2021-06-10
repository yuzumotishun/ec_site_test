Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post 'guest_login' => 'sessions#guest_login'
  get 'carts/show', to: 'carts#show', as: 'carts_show'
  post 'carts/add_cart', to: 'carts#add_cart'
  patch 'carts/change_quantity', to: 'carts#change_quantity', as: 'change_item_quantity'
  delete 'carts/destroy_carts_item', to: 'carts#destroy_carts_item', as: 'destroy_carts_item'
  post 'orders/create', to: 'orders#create', as: 'orders_create'
  get '/perchase_completed', to: 'orders#perchase_completed', as: 'perchase_completed'
  resources :products
  resources :users
  resources :orders
  root to: 'static_pages#home'
end
