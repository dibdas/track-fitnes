
Rails.application.routes.draw do
 
  post '/login', to: 'authentication#authenticate'
  post '/signup',action: :create, controller: 'authentication'
  # resource :authentication
  resources :exercises
  resources :measurements
  
end
