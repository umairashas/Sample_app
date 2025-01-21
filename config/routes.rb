Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"
  # devise_scope :user do
  #   get '/auth/:provider/callback', to: 'users/omniauth_callbacks#google_oauth2'
  # end
    get 'users/auth/facebook', to: 'users/omniauth_callbacks#passthru'

  resources :todos
end
