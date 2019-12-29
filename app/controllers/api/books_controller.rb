class Api::BooksController < ApplicationController
  # ローカルで動作確認をするためCSRFトークンを無視してPOST,PUT,DELETEを可能にしている
  # 本番では外す
  # IPアドレスで許可する方法もあるみたい
  protect_from_forgery with: :null_session
  def index
  end

  def show
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
  end

  def update
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :publisher,
      :status,
      :gist,
      :impression
    )
  end
end
