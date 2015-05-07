Rails.application.routes.draw do
  root 'home#index'

  get 'login' => 'sessions#new', :as => :login
  get 'signup' => 'users#new', :as => :signup
  delete 'logout' => 'sessions#destroy', :as => :logout
  
  mount_devise_token_auth_for "Member", at: 'api/v1/auth'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :errors, only: [:create, :index]
    end
  end
end
