Rails.application.routes.draw do
  get 'chats/index'
  get 'home/index'
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update, :show, :destroy]
    resources :users, only: [:index, :create, :update, :show, :destroy]
    resources :sessions, only: [:new, :create, :destroy,:show, :index]
    resources :ptags, only: [:index,:create, :update, :destroy,:show]
    resources :login, only: [:index,:create, :update, :destroy,:show]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
