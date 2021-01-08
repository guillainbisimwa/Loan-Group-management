Rails.application.routes.draw do
  #get 'user#login'
  root 'user#home'
  resources :users, only: [:show, :new, :create]
  #resources :groups, only: [:show]

  get 'home', to: 'user#show'
  get 'group', to: 'groups#show'

  get 'new_group', to: 'groups#new'
  get 'new_loan', to: 'loans#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'sessions#signup'
  post'signup', to: 'sessions#register'
end
