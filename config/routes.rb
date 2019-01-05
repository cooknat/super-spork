# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :clubs

  get "welcome/index"
  get "welcome/about"
  get "about" => "welcome#about"
  get "faq" => "welcome#faq"
  get "contact" => "welcome#contact"

  root "welcome#index"
end
