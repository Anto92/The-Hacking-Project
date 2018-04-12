Rails.application.routes.draw do

  get 'home/checkr'

  get 'home/flynn'

  root "home#index"
end
