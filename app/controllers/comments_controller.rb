class CommentsController < ApplicationController
  include Gravatarify::Helper

  def index
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.json { render json: comment_results(@comment) }
    end
  end

  private

  def comment_results(comment)
    { 
      gravatar: gravatar_image(comment.email), 
      name: comment.name, 
      comment: comment.comment, 
      count: comment_count, 
      created_at: comment.created_at 
    }
  end

  def gravatar_image(email)
    url = gravatar_url(email)
    has_gravatar?(url) ? url : ""
  end

  def has_gravatar?(url)
    !url.include?("ed955fd3e6278969c23c7c148aa09aff")
  end

  def comment_count
    Comment.count
  end
  
  def comment_params
    params.require(:comment).permit(:name, :email, :comment)
  end
end
