Rails.application.routes.draw do
  resource :random_dog, only: :show
  resources :dogs, only: [:show, :create]

  root 'home#show'
end
