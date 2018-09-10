Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  get 'users/new'
  resources :users
  
  resources :questions
  root 'questions#index'

  # resources :comments do
  #   resources :comments
  # end


end
