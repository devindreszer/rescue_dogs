Rails.application.routes.draw do
  devise_for :users
  resource :random_dog, only: :show
  resources :dogs, only: [:index, :show]

  root 'home#show'
end
