# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:create, :new]
  end
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :charges
end
