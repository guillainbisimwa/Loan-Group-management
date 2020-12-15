Rails.application.routes.draw do
  devise_for :users
  #get 'user#login'
  root 'user#index'

  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
