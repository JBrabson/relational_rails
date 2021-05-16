Rails.application.routes.draw do
  get '/', to: 'application#welcome'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:id/players', to: 'team_players#index'
end
