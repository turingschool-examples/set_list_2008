Rails.application.routes.draw do
  root 'welcome#index'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'

  get '/artists', to: 'artists#index'
  post '/artists', to: 'artists#create'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id', to: 'artists#show'
  patch 'artists/:id', to: 'artists#update'
  get 'artists/:id/edit', to: 'artists#edit', as: :edit_artist
end
