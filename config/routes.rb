Rails.application.routes.draw do

  root 'users#new'

  resources :tasks

  resources :users

  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
