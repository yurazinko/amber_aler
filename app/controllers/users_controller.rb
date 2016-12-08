class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:name, :email))
      redirect_to user_path
    else
      render :edit
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end
end
