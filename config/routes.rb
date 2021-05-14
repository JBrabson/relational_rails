Rails.application.routes.draw do
  get '/', to: 'application#welcome'
  get '/instruments', to: 'instruments#index'
  get '/music_stores', to: 'music_stores#index'
  get '/music_stores/:id', to: 'music_stores#show'
  get 'instruments/:id', to: 'instruments#show'
end
