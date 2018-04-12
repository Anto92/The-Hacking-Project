Rails.application.routes.draw do

  root 'sessions#new'
  
  # Session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

   #users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #Events
  get 'events/new'
  post 'events/create'
  get 'event/show/:id', to: 'events#show', as: 'test'
  get 'events/index'
  post 'events/suscribe/:id', to: 'events#suscribe', as: 'register'
  post 'events/unsuscribe/:id', to: 'events#unsuscribe', as: 'unregister'



  resources :users
end
