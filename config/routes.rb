Rails.application.routes.draw do
  resources :manufacturers do
    resources :products
  end
end
