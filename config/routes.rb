Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/instruments', to: 'instruments#index'
  get '/instruments/:id', to: 'instruments#show'
  get '/instruments/:id/edit', to: 'instruments#edit'
  patch '/instruments/:id', to: 'instruments#update'
  delete '/instruments/:id', to: 'instruments#destroy'

  get '/music_stores', to: 'music_stores#index'
  get '/music_stores/new', to: 'music_stores#new'
  post '/music_stores', to: 'music_stores#create'
  get '/music_stores/:id', to: 'music_stores#show'
  get '/music_stores/:id/edit', to: 'music_stores#edit'
  patch '/music_stores/:id', to: 'music_stores#update'
  delete '/music_stores/:id', to: 'music_stores#destroy'

  get '/music_stores/:id/instruments/new', to: 'music_store_instruments#new'
  post '/music_stores/:id/instruments', to: 'music_store_instruments#create'
  get '/music_stores/:id/instruments', to: 'music_store_instruments#index'
  get '/music_stores/:id/instruments/alphabetical', to: 'music_store_instruments#sort'
  get '/music_stores/:id/instruments/filter', to: 'music_store_instruments#filter'
end
