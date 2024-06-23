# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show index]
  resources :passages
  resources :props
  resources :actors
  resources :items
  resources :creatures
  resources :stages do
    member do
      get :game, to: "stages/game#index"
    end
    resources :props, only: %i[index show], controller: "stages/props"
    resources :passages, only: %i[index show], controller: "stages/passages"
    resources :actors, only: %i[index show], controller: "stages/actors"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "stages#index"
end
