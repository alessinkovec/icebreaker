Rails.application.routes.draw do
  root to: 'events#index'
  # post '/events', to: 'events#create'

  resources :events, only: [:index, :show, :create, :update]
  resources :chats

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
