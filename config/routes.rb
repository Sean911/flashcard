Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: [:index, :show, :destroy, :edit, :update]

  resources :lists, only: [:index, :show, :new,
     :create, :edit, :update, :destroy] do
       resources :words, only: [:new, :create, :show, :destroy]
     end
end
