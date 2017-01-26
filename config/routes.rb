Rails.application.routes.draw do
  resources :robots, except: [:destroy]

  resources :manufacturers, only: [:index, :show] do
    resources :products
  end
end
