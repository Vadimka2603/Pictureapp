Rails.application.routes.draw do

  root             'static_pages#home'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users do 
    resources :photos do 
      resources :comments do
        resources :answers
      end  
    end
  end
 resources :likes
  
  resources :comments
  resources :photos do
    resources :likes, controller: :likes
  end
  resources :users do 
    resources :comments
  end
  resource :instagram do
    resource :callback, only: [:show, :create]
  end

  namespace :api, defaults: {format: 'json'} do
    resources :users 
    get 'current_user' => 'users#current'
    resources :photos do
      resources :likes, controller: :likes
      resources :comments, controller: :comments
    end
    resources :comments
    resource  :raiting
  end  
end
