Rails.application.routes.draw do
  # Set a custom homepage.
  root 'home#index'

  # Get the Channel basic CRUD routes.
  resources :channels

  # Omniauth callbacks.
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'

  # User actions.
  get '/signin',                  to: 'sessions#new',     as: :signin
  get '/signout',                 to: 'sessions#destroy', as: :signout
end
