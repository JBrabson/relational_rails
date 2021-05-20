Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/auto_dealerships', to: 'auto_dealerships#index'
  get '/auto_dealerships/new', to: 'auto_dealerships#new'
  get '/auto_dealerships/:id', to: 'auto_dealerships#show'
  post '/auto_dealerships', to: 'auto_dealerships#create'
  get '/auto_dealerships/:id/edit', to: 'auto_dealerships#edit'
  patch '/auto_dealerships/:id', to: 'auto_dealerships#update'

  get '/auto_dealerships/:id/automobiles', to: 'auto_dealerships_automobiles#index'
  get '/auto_dealerships/:id/automobiles/sorted', to: 'auto_dealerships_automobiles#index'
  get '/auto_dealerships/:id/automobiles/new', to: 'auto_dealerships_automobiles#new'
  get '/auto_dealerships/:id/automobiles/:id', to: 'auto_dealerships_automobiles#show'
  post '/auto_dealerships/:id/automobiles', to: 'auto_dealerships_automobiles#create'

  get '/automobiles', to: 'automobiles#index'
  get '/automobiles/:id', to: 'automobiles#show'
  get '/automobiles/:id/edit', to: 'automobiles#edit'
  patch '/automobiles/:id', to: 'automobiles#update'
end
