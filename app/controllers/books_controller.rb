class BooksController < ApplicationController
  def new
   
  end

  def create
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to "/books/index"
  end

  def index
    @book = Book.new
    @books=Book.all
  end

  def show
    @books=Book.all
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
