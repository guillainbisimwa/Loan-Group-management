Rails.application.routes.draw do
  #get 'user#login'
  root 'user#home'
  resources :users, only: [:show, :new, :create]  

  get 'home', to: 'user#show'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'sessions#signup'
  post'signup', to: 'sessions#register'
end
