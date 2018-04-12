Rails.application.routes.draw do
  devise_for :mousaillons
  get 'home/index'

  root 'home#index'

  resources :gossips

end
