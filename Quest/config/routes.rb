Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :answers

  get 'users/new'
  resources :users
  
  resources :questions do 
    resources :answers
  end

  root 'questions#index'

end
