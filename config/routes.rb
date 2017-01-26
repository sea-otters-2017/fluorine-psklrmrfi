Rails.application.routes.draw do
  resources :sessions, only: [:new, :destroy]
  root 'unwelcome#index'
end
