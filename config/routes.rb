Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :products
  resources :users
  resources :orders
end
