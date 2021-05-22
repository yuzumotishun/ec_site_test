Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :products
  resources :users
end
