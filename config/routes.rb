Rails.application.routes.draw do
  resources :products
  get "/products/not_find", to:"products#not_find"
  resources :users
end
