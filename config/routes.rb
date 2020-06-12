Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/destroy'
  get 'order_items/update'
  get 'carts/show'
  root "client#index"
  get "login" => "sessions#new"
  get "signup" => "users#new"
  get "admin" => "users#index"
  post   'login'   => 'sessions#create'
  post 'comments' => "client#comment"  
  delete 'logout'  => 'sessions#destroy'
  get "search" => "client#search" , as: 'search'
  post "search" => "client#search" 
  get "products" => "products#index"
  get "details/:id" => "client#details" , as: "details"
  get "category/:id" => "client#category" , as: "category"
  resources :users
  resources :products
  resources :categories
  get "cart" => "carts#show"
  resources :order_items
end
