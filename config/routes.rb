Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :show]
    resources :conversations, only: [:index, :show]
    resource :current_user, only: [:show]
    resources :questions, only: [:show, :index]
    resources :answer_choices, only: [:show]
    resources :user_answers, only: [:show, :new, :create]
  end
  root "static_pages#root"
  get "/auth/:provider/callback", to: "sessions#omniauth"
end
