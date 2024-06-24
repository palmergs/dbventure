# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :manage do
    resources :passages
    resources :props
    resources :actors
    resources :items
    resources :creatures
    resources :stages
  end

  resource :profile, only: %i[show update]
  resources :character, except: %i[destroy]
  resource :game, only: %i[show update] do
    resources :props, only: %i[index show], controller: "game/props"
    resources :passages, only: %i[index show], controller: "game/passages"
    resources :actors, only: %i[index show], controller: "game/actors"
    resources :creatures, only: %i[index show], controller: "game/creatures"
    resources :items, only: %i[index show], controller: "game/items"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
