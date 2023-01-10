Rails.application.routes.draw do
  root "users#index"

  devise_for :users

  resources :posts
  resources :users do
    resources :posts
  end
end
