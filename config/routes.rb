Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session
  root "users#new"
end
