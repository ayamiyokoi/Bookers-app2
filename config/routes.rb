Rails.application.routes.draw do
  get "/" => 'homes#top'
  get "homes/top" => 'homes#top'
  get "homes/about" =>'homes#about'
  get "books/new" => 'books#index'
  post 'books' => 'books#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
