Rails.application.routes.draw do
  resources :answers
  resource :session, only: [:new, :create, :destroy]

  get 'users/new'
  resources :users
  
  resources :questions do 
    resources :answers
  end

  root 'questions#index'

end
