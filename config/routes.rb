Rails.application.routes.draw do

  root 'unwelcome#index'

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :robots, except: [:destroy] do
    member do
      get 'mark_received'
    end
  end

  resources :manufacturers, only: [:index, :show] do
    resources :products, only: [:show]
  end

  resources :purchases, only: [:create]
end
