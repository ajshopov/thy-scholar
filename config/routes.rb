# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lectures
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    :registrations => :registrations
  }
  resources :users, only: [:show, :index]
  root 'pages#search'
  resources :questions do
    resources :answers, only: [:create, :new]
    resources :charges, only: [:create, :new]
    member do
      post :accept
    end
  end
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  # get 'users/auth/stripe_connect/callback', to: 'stripe_connect#create'

end
