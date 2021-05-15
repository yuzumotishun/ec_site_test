Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post   'login'   => 'sessions#create'
  resources :products
  resources :users
end
