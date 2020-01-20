# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'

resources :resources
resources :accounts
resources :users, only: [:create]

get '/register', to: 'users#new', as: :register
get '/login', to: 'sessions#new', as: :login
