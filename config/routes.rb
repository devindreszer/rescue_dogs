Rails.application.routes.draw do
  devise_for :users
  resource :random_dog, only: :show
  resources :dogs, only: :show
  resources :dog_matches, only: [:index, :destroy]

  root 'home#show'
end
