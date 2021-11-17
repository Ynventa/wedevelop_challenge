Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :books, :authors, :clients
    resources :orders, only: [:index, :show, :create]
  end
end
