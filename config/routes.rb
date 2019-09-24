Rails.application.routes.draw do

  root 'users#new'

  namespace :admin do
    resources :users
  end

  resources :tasks

  resources :users

  resources :sessions

  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
