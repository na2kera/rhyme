# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'
  get 'quiz/:name', to: 'home#show', as: 'quiz'
  post 'quiz/:name', to: 'home#check_answer'
  mount Sidekiq::Web, at: '/sidekiq'
end
