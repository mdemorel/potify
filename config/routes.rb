Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :plants, only: [:index, :show]
  resources :pots
  resources :tasks, only: [:update, :destroy]

end
