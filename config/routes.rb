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

  get '/instruments', to: 'instruments#index'
  get '/instruments/find_exact', to: 'instruments#find_exact'
  get '/instruments/find_partial', to: 'instruments#find_partial'
  get '/instruments/:id', to: 'instruments#show'
  get '/instruments/:id/edit', to: 'instruments#edit'
  patch '/instruments/:id', to: 'instruments#update'
  delete '/instruments/:id', to: 'instruments#destroy'

  get '/music_stores', to: 'music_stores#index'
  get '/music_stores/new', to: 'music_stores#new'
  post '/music_stores', to: 'music_stores#create'
  get 'music_stores/find_exact', to: 'music_stores#find_exact'
  get 'music_stores/find_partial', to: 'music_stores#find_partial'
  get '/music_stores/sort', to: 'music_stores#sort'
  get '/music_stores/:id', to: 'music_stores#show'
  get '/music_stores/:id/edit', to: 'music_stores#edit'
  patch '/music_stores/:id', to: 'music_stores#update'
  delete '/music_stores/:id', to: 'music_stores#destroy'

  get '/music_stores/:id/instruments/new', to: 'music_store_instruments#new'
  post '/music_stores/:id/instruments', to: 'music_store_instruments#create'
  get '/music_stores/:id/instruments', to: 'music_store_instruments#index'
  get '/music_stores/:id/instruments/sort', to: 'music_store_instruments#sort'
  get '/music_stores/:id/instruments/filter', to: 'music_store_instruments#filter'

end
