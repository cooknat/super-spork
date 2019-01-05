# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :clubs

  get "welcome/index"
  get "welcome/about"
  get "about" => "welcome#about"

  root "welcome#index"
end
