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
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create]
  end
  #resourceで親子関係を作って言うr resource - do resource ~ endにて作成
  # endを忘れないように注意!


  #get 'users/show'
  #get 'users/edit'
  #get 'users/update'
  resources :users, only: [:show, :edit, :update]

end

