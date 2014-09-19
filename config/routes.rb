Rails.application.routes.draw do
  # Get the Channel basic CRUD routes.
  resources :channels

  # Set a custom homepage.
  root 'home#index'
end
