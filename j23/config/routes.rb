Rails.application.routes.draw do

  get 'static_pages/home'

  root 'sessions#new'
  
  # Session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

   #users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
end
