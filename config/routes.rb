Rails.application.routes.draw do
  root 'tasks#index'

  resources :sessions
  resources :users
  namespace :admin do
    resources :users
  end
  resources :tasks
  resources :connects
  resources :labels

  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
