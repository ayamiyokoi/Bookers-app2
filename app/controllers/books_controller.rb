class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book = Book.new
    @books=Book.all
  end

  def show
    @books=Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @books=Book.all
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
