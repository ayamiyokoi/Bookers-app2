class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @books=Book.all
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
