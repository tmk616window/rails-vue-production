Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  get '/login', to: 'home#index'
  get '/:id', to: 'home#index'
  get '/signup', to: 'home#index'
  get '/profile/:id', to: 'home#index'

  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update, :show, :destroy]
    resources :users, only: [:index, :create, :update, :show, :destroy]
    resources :sessions, only: [:new, :create, :destroy,:show, :index]
    resources :ptags, only: [:index,:create, :update, :destroy,:show]
    resources :itags, only: [:index,:create, :update, :destroy,:show]
    resources :taskcomments, only: [:index,:create, :update, :destroy,:show]
    resources :login, only: [:index,:create, :update, :destroy,:show]
    resources :likes, only: [:index,:create, :destroy,:show]
 end

 scope '/api' do
  get '/taskcomments/show/:id', to: 'api/taskcomments#show2', defaults: { format: :json }
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
