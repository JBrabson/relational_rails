Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/auto_dealerships', to: 'auto_dealerships#index'
  get '/auto_dealerships/:id', to: 'auto_dealerships#show'

  get '/auto_dealerships/:id/automobiles', to: 'auto_dealerships_automobiles#index'

  get '/automobiles', to: 'automobiles#index'
  get 'automobiles/:id', to: 'automobiles#show'
end
