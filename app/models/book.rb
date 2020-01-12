class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :status, presence: true
  validates :gist, length: { maximum: 5000 }
  validates :impression, length: { maximum: 10000 }
  validates :image, presence: true

  # クラスインスタンスメソッド
  # 書籍一覧表示に必要な情報だけを返す
  def self.res_index(books)
    res_books = books.map do |book|
      { id: book.id, title: book.title, image: book.image }  
    end
    res_books
  end

  # インスタンスメソッド
  # 個別書籍表示に必要な情報だけを返す
  def res_show
    {
      id: self.id,
      title: self.title,
      author: self.author,
      publisher: self.publisher,
      status: self.status,
      gist: self.gist,
      impression: self.impression,
      image: self.image,
      gistWordCount: self.gist.length,
      impressionWordCount: self.impression.length
    }
  end

  # 個別書籍データを更新する
  def update_book(params)
    self.title = params[:title]
    self.author = params[:author]
    self.publisher = params[:publisher]
    self.status = params[:status]
    self.gist = params[:gist]
    self.impression = params[:impression]
    self.image = params[:image]
    self
  end
end
