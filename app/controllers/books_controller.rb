class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = 'You have created book successfully.'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @book = Book.new
    @books=Book.all
    @user = current_user
  end

  def show
    # @books=Book.all
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    # @books=Book.all
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book)
       flash[:notice] = 'You have updated book successfully.'
    else
       flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
