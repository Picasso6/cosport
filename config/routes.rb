Rails.application.routes.draw do
  get 'events/show'
  get 'events/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :events, only: [:show, :index , :new , :create] do
    resources :comments, only: [:create, :new]
    resources :attendances, only: [:create, :edit, :update, :destroy]

  end

  resources :users, only: [:show, :index ] do
    resources :profil_picture, only: [:create]
  end
  resources :homes, only: [:index]
  root 'home#index'

  namespace :admin do
    root 'admin#index'
    resources :users, :events
  end
end
