Rails.application.routes.draw do
  #get 'user#login'
  root 'user#home'
  resources :users, only: [:index, :show]
  get 'login', to: 'sessions#new'
  get 'signup', to: 'sessions#signup'
  post'signup', to: 'sessions#register'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
