Rails.application.routes.draw do

  resources :categories do
    resources :items, shallow: true
  end

  resources :carts, only: [:show, :destroy]

  resources :cartitems, only: [:create, :show, :destroy] do
    post :add_quantity, on: :member
    post :reduce_quantity, on: :member
  end

  root to: 'categories#index'
end
