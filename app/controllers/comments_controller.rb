class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment Posted Successfully"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    comment = Comment.find(params[:id])
    Vote.create(user_id: current_user.id, voteable: comment, vote: params[:vote])
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit!
  end
end