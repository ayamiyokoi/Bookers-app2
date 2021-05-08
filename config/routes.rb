Rails.application.routes.draw do
  devise_for :users
  get "homes/about" =>'homes#about'
  get '/' => 'homes#top'
  get '/books/edit/:id' => 'books#edit'
  get '/homes/top' => 'books#index'
  # root to: 'books#index'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
