Rails.application.routes.draw do

  resources :categories do
    resources :items, shallow: true
  end

  resources :carts,     only: [:show, :destroy]
  resources :cartitems, only: [:create, :update, :show, :destroy]
  resources :orders

  root to: 'categories#index'
end
