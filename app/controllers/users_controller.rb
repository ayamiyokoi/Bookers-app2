class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] =  'You have updated user successfully.'
    else
    flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to books_path
      flash[:notice] = 'Welcome! You have signed up successfully.'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
