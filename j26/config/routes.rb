Rails.application.routes.draw do
	root 'cryptos#home'
	post '/', to: 'cryptos#show'
end
