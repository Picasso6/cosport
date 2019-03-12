Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show ] do
    resources :avatar, only: [:new, :create]
  end
  get 'home/index'
  root 'home#index'
end
