Rails.application.routes.draw do
  get "messages/create"
  root "home#index"
  resource :session
  resources :passwords, param: :token
  resources :users, only: %i[ new create ]
  resources :messages, only: [ :create ]

  get "up" => "rails/health#show", as: :rails_health_check
end
