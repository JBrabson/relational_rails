Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/auto_dealerships', to: 'auto_dealerships#index'
  get '/auto_dealerships/new', to: 'auto_dealerships#new'
  get '/auto_dealerships/:id', to: 'auto_dealerships#show'
  post '/auto_dealerships', to: 'auto_dealerships#create'

  get '/auto_dealerships/:id/automobiles', to: 'auto_dealerships_automobiles#index'
  get '/auto_dealerships/:id/automobiles/:id', to: 'auto_dealerships_automobiles#show'

  get '/automobiles', to: 'automobiles#index'
  get '/automobiles/:id', to: 'automobiles#show'
end
