Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users
  resources :pairings, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
end
