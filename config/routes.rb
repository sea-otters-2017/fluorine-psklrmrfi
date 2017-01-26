Rails.application.routes.draw do
  root 'unwelcome#index'
  resources :sessions, only: [:new, :destroy]
end
