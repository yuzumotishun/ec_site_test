Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  resources :products
  resources :users
end
