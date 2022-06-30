Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # patch '/users', to: 'users#update'
  # get '/users/:id/edit', to: 'users#edit'
  # delete '/users', to: 'users#destroy'
  
  resources :users, only: [:index, :show, :update, :destroy, :create]
  resources :artworks, only: [:update, :destroy, :show, :create]
  resources :users do
    resources :artworks, only: :index
  end
  resources :artwork_shares, only: [:create, :destroy, :index]
  resources :comments, only: [:create, :destroy]
  resources :users do
    resources :comments, only: :index
  end
  resources :artworks do
    resources :comments, only: :index
  end
end

