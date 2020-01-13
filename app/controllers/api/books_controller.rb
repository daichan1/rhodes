class Api::BooksController < ApplicationController
  # ローカルで動作確認をするためCSRFトークンを無視してPOST,PUT,DELETEを可能にしている
  # 本番では外す
  # IPアドレスで許可する方法もあるみたい
  protect_from_forgery with: :null_session
  def index
    books = Book.all
    books = books.where(status: params["status"]) if params["status"].present?
    res_books = Book.res_index(books)
    render json: res_books
  end

  def show
    book = Book.find(params[:id])
    res_book = book.res_show
    render json: res_book
  end

  def new
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: "書籍の追加に成功しました"
    else
      render json: "書籍の追加に失敗しました"
    end
  end

  def edit
    book = Book.find(params[:id])
    res_book = book.res_show
    render json: res_book
  end

  def update
    book = Book.find(id_param["id"])
    book = book.update_book(book_params)
    if book.save
      render json: "書籍の更新に成功しました"
    else
      render json: "書籍の更新に失敗しました"
    end
  end

  def destroy
    book = Book.find(id_param["id"])
    if book.destroy
      render json: "書籍の削除に成功しました"
    else
      render json: "書籍の削除に失敗しました"
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :publisher,
      :status,
      :gist,
      :impression,
      :image
    )
  end

  def id_param
    params.permit(:id)
  end
end
