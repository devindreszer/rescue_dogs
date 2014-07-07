Rails.application.routes.draw do
  resource :random_dog, only: :show
  root 'home#show'
end
