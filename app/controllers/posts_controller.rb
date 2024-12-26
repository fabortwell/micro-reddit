class PostsController < ApplicationController
  def index
    posts = Post.includes(:user)
    render json: posts, include: :user
  end

  def show
    post = Post.includes(:user, :comments).find(params[:id])
    render json: post, include: [ :user, :comments ]
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end
end
