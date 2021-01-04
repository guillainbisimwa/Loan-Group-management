Rails.application.routes.draw do
  #get 'user#login'
  root 'user#index'
  resources :users, only: [:index, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
