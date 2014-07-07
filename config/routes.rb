Rails.application.routes.draw do
  resources :dogs, only: [:show, :create]
  root 'home#show'
end
