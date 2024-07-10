Rails.application.routes.draw do

  devise_for :users
  #get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"

  get 'homes/about' => 'homes#about', as: 'about'

  #get 'post_images/new'
  #get 'post_images/show'
  #get 'post_images/index'
  #↓post_imagesの3つのルーティングを以下まとめる
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  #get 'users/show'
  #get 'users/edit'
  resources :users, only: [:show, :edit]
  
end

