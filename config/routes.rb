Rails.application.routes.draw do
  root 'home#index'

  get 'login' => 'sessions#new', :as => :login
  get 'signup' => 'members#new', :as => :signup
  delete 'logout' => 'sessions#destroy', :as => :logout

  resources :errors, only: [:show, :index]
  # resources :members, only: [:index]
  resources :users, only: [:index]
  resources :accounts, only: [:show]

  mount_devise_token_auth_for "Member", at: 'api/v1/auth'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :errors, only: [:create, :index]
      resources :users, only: [:index]
      resources :members, only: [:show]
    end
  end
end
