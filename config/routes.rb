Rails.application.routes.draw do


  resources :users, only: [:new, :create]
  resource :session
  resources :subs
  resources :posts, only: [:new, :create, :edit, :update, :show, :destroy]
end
