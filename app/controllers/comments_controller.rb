class CommentsController < ApplicationController
  def index
    comments = Comment.includes(:user, :post)
    render json: comments, include: [ :user, :post ]
  end

  def index
    user = User.find(params[:user_id])
    comments = user.comments.includes(:post)
    render json: comments, include: :post
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def index
    post = Post.find(params[:post_id])
    comments = post.comments.includes(:user)
    render json: comments, include: :user
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  def show
    comment = Comment.includes(:user, :post).find(params[:id])
    render json: comment, include: [ :user, :post ]
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Comment not found" }, status: :not_found
  end
end
