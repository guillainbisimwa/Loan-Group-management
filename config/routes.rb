Rails.application.routes.draw do
  resources :user, only: [:show, :create]
  resources :groups, only: [:index, :new, :create, :show]

  resources :loans, only: [:index, :new, :create, :show]

  get 'home', to: 'user#index'

  get 'new_group', to: 'groups#new'
  get 'new_loan', to: 'loans#new'
  get 'external', to: 'loans#external'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'sessions#signup'
  post'signup', to: 'sessions#register'

  root 'sessions#index'

end
