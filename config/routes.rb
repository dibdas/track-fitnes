Rails.application.routes.draw do
 
  post '/login', to: 'authentication#authenticate'
  # post '/create_user', to: 'authentication#authenticate'
  post '/signup',action: :create, controller: 'authentication'
  # resource :authentication
  resources :exercise
  resources :measurement
  
end
