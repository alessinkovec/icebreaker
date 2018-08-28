Rails.application.routes.draw do
  root to: 'events#index'
  # post '/events', to: 'events#create'

  resources :events, only: [:index, :show, :create, :update, :destroy]
  resources :chats

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
