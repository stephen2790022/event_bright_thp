Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :events do
    resources :attendances
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
