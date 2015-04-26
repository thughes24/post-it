class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have registered successfully!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:notice] = "account updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation, :email)
  end
end