Uploadist::Application.routes.draw do
  resources :albums do 
    resources :photos
  end

  resources :album_photos

  

  resources :ratings

  resources :users, :albums, :photos
  root to: 'users#home'

  get 'signup', to: 'users#new', as: 'signup'

  # get '/auth/facebook/' => 'users#index'

  # OmniAuth stuff 
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
