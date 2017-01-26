Rails.application.routes.draw do
  root 'unwelcome#index'

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :robots, except: [:destroy]
  resources :manufacturers, only: [:index, :show] do
    resources :products
  end
end
