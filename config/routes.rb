Rails.application.routes.draw do
  # Set a custom homepage.
  root 'home#index'

  # Get the Channel basic CRUD routes.
  resources :channels
end
