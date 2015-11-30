class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: comment_results(@comment), status: :ok
    else
      render json:  @comment, status: :error
    end
  end

  private

  def comment_results(comment)
    { 
      gravatar: comment.gravatar_image,
      name: comment.name,
      comment: comment.comment, 
      count: Comment.comment_count, 
      created_at: comment.created_at 
    }
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :comment)
  end
end

