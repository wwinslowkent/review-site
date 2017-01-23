Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    index: '/users'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homepage#index'
  resources :homepage

  resources :games do
    resources :reviews, except: [:index, :show]
  end

  resources :api, only: [:index]

  devise_for :admins
  resources :admins, only: [:index]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :users
end
