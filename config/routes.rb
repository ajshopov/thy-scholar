# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'

  resources :questions do
    member do
      post :answering
    end
  end
end
