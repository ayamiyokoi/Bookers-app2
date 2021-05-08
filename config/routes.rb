Rails.application.routes.draw do
  devise_for :users
  get "homes/about" =>'homes#about'
  get '/' => 'homes#top'
  # get '/homes/top' => 'books#index'
  get '/users/:id' => 'books#index'
  patch 'books/:id' => 'books#show', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # get 'users/index'=> 'users#index', as: 'user_index'
  # root to: 'books#index'
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:edit, :update, :index, :show]
end
