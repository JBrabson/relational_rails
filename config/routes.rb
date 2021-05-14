Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/auto_dealerships', to: 'auto_dealerships#index'
  get '/auto_dealerships/:id', to: 'auto_dealerships#show'

  get '/auto_dealerships/:id/automobiles', to: 'auto_dealerships_automobiles#index'
  get '/auto_dealerships/:id/automobiles/:id', to: 'auto_dealerships_automobiles#show'
  #ONLY WORKS WHEN AUTO ID MANUALLY INPUT TO URL

  get '/automobiles', to: 'automobiles#index'
  get 'automobiles/:id', to: 'automobiles#show'
end
