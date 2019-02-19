# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  root 'questions#index'
  resources :questions do
    resources :answers
  end
end
