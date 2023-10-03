Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!

  resources :users do
    resources :attendances, only: [:index]
  end

  resources :events do
    resources :attendances, except: [:index]
  end

  resources :attendances, only: [:create, :update, :destroy]

  post '/signup', to: 'users#create'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
