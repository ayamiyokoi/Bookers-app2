Rails.application.routes.draw do
  devise_for :users
  # get '/homes/top' => 'books#index'
  # patch 'books/:id' => 'books#show', as: 'update_book'
  # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # get 'users/index'=> 'users#index', as: 'user_index'
  # root to: 'books#index'
  root to: 'homes#top'
  get 'home/about' =>'homes#about', as: 'homes_about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:edit, :update, :index, :show]
end
