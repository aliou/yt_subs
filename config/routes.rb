Rails.application.routes.draw do
  root 'home#index'

  resources :channels

  resources :users, only: [:edit, :update]

  # Omniauth callbacks.
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'

  # User actions.
  get '/signin',                  to: 'sessions#new',     as: :signin
  get '/signout',                 to: 'sessions#destroy', as: :signout
end
