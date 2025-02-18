  Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
      root to: "home#home"
  # devise_scope :user do
  #   get '/auth/:provider/callback', to: 'users/omniauth_callbacks#google_oauth2'
  # end
  resources :todos
end
