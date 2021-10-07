
Rails.application.routes.draw do
 
  
  post '/authenticate', to: 'authentication#authenticate'
  post '/authentication', action: :create, controller: 'authentication'
  resources :exercises
  resources :measurements
  
end
