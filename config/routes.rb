Rails.application.routes.draw do

  resources :games, except: [:destroy]

end
