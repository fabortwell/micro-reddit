Rails.application.routes.draw do
    resources :users, only: [ :index, :show ] do
      resources :posts, only: [ :index ], controller: "users/posts"
      resources :comments, only: [ :index ], controller: "users/comments"
    end

    resources :posts, only: [ :index, :show ] do
      resources :comments, only: [ :index ], controller: "posts/comments"
    end

    resources :comments, only: [ :index, :show ]
  end
