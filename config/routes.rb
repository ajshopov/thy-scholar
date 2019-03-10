# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:create, :new]
    resources :charges, only: [:create, :new]
    member do
      post :accept
    end
  end
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

end
