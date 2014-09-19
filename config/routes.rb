Rails.application.routes.draw do
  devise_for :users
  resource :random_dog, only: :show
  resources :dogs, only: :show
  resources :dog_queries, only: [:index, :destroy, :update]

  root 'home#show'
end
