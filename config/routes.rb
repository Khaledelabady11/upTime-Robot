
require "sidekiq/web"
Sidekiq::Web.app_url = "/"
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'


  root 'websites#index'

  resources :websites
end
