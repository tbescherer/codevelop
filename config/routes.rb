Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resource :session

  namespace :api, defaults: {format: :json} do
    resource :current_user, only: [:show]
    resources :questions, only: [:show]
    resources :answers, only: [:show]
    resources :question_answers, only: [:show, :new, :create]
  end
  root "static_pages#root"
end
