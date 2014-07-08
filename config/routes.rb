Rails.application.routes.draw do
  resource :random_dog, only: :show
  resources :dogs, only: :show

  root 'home#show'
end
