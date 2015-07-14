Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resource :session

  namespace :api, defaults: {format: :json} do
    resource :current_user, only: [:show]
  end
  root "static_pages#root"
end
