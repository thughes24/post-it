class PostsController < ApplicationController
  before_action :require_user, only: [:new,:edit,:vote]
  before_action :set_post, only: [:show,:edit,:update,:vote]

  def index
    @posts = Post.all
  end
  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post created :)"
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated :)"
      redirect_to posts_path
    else
      render :update
    end
  end

   def vote
    vote = Vote.create(user: current_user, voteable: @post, vote: params[:vote])
    if vote.valid?
      flash[:notice] = "Vote counted successfully!"
      redirect_to :back
    else
      flash[:error] = 'You can only vote once, prick.'
      redirect_to :back
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
