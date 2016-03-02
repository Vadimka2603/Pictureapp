Rails.application.routes.draw do

  root             'static_pages#home'

  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users do 
    resources :photos
  end

  resources :users
  resources :photos
 
end
