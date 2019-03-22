Rails.application.routes.draw do

  get 'users_sports/create'
  get 'events/show'
  get 'events/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :events do
    resources :comments, only: [:create, :new]
    resources :comments, only: [:create, :new, :destroy]
    resources :attendances, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resources :profil_picture, only: [:create]
    resources :opinions, only: [:create, :new]
    resources :opinions, only: [:create, :new, :destroy]
    resources :users_sports, only: [:create, :destroy]
    resources :attendances, only: [:index]
  end

  resources :search, only: [:index]

  resources :homes, only: [:index]
  root 'home#index'

  namespace :admin do
    root 'admin#index'
    resources :users, :events
  end

  resources :maps, only: [:index,]
end
