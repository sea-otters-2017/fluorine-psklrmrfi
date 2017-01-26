Rails.application.routes.draw do

  resources :robots, except: [:destroy]

end
