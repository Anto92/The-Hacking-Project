Rails.application.routes.draw do
  
  get 'movies/index'
  
  root 'movies#index'

  post '/movies', to: 'movies#search'

  get '/movies', to: 'movies#search'  
end
