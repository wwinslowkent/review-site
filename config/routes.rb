Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homepage#index'
  resources :homepage

  resources :games, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :api, only: [:index]

end
