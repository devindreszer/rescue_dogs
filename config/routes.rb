Rails.application.routes.draw do
  devise_for :users
  resource :random_dog, only: :show
  resources :dogs, only: :show

  root 'home#show'
end
