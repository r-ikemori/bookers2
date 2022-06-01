class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
    @user = current_user
    unless @user == current_user
    redirect_to users_path(current_user.id)
    end
  end
end
