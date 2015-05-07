Rails.application.routes.draw do
  root 'home#index'

  get 'login' => 'sessions#new', :as => :login
  get 'signup' => 'users#new', :as => :signup
  delete 'logout' => 'sessions#destroy', :as => :logout

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for "Member", at: 'auth'
      resources :errors, only: [:create, :index]
    end
  end
end
