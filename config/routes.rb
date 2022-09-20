Rails.application.routes.draw do
  root 'website#index'

  resources :website
end
