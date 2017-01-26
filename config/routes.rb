Rails.application.routes.draw do
  resources :robots, except: [:destroy]
  resources :manufacturers do
    resources :products
  end
end
