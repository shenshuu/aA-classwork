Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new'
  patch '/users', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit'
  delete '/users', to: 'users#destroy'
end
