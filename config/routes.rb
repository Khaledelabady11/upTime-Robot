Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq-dashboard'

  root 'websites#index'

  resources :websites
end
