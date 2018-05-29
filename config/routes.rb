Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :plants, only: [:index, :show]
  resources :pots, only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
