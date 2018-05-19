Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  resources :users, only: :index

  resources :conversations, only: [:new, :create, :show] do
    resources :messages, only: :create
  end
end
