Rails.application.routes.draw do

  resources :comments, only: [:create]
  resources :users, only: [:new, :create]
  resource :session
  resources :subs
  resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :comments, only: [:new]
  end
end
