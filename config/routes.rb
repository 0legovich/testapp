Rails.application.routes.draw do

  resources :categories do
    resources :items, shallow: true
  end

  root to: 'categories#index'
end
