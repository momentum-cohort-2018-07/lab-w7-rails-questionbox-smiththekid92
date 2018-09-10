Rails.application.routes.draw do
  get 'questions' => 'questions#show'
  # get 'questions/body:text'
  # get 'questions/username:string'
  # get 'questions/user_id:integer'
  resources :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
