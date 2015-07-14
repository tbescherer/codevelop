Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session
  root "static#root"
end
