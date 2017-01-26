Rails.application.routes.draw do
  root 'unwelcome#index'

  resources :sessions, only: [:new, :destroy]
  resources :robots, except: [:destroy]
  resources :manufacturers, only: [:index, :show] do
    resources :products
  end
end
