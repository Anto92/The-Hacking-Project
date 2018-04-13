Rails.application.routes.draw do
  root 'home#index'
  resources :items
  resources :carts

  # get 'carts/show'

  # get 'carts/create'

  # get 'carts/destroy'

  # get 'cart/create'

  # get 'cart/destroy'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  get 'cart/show'
  post 'cart/:id', to: "items#AddToCart", as: "add_to_cart"
  
end
