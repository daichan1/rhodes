class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :status, presence: true
  validates :gist, presence: true, length: { maximum: 5000 }
  validates :impression, presence: true, length: { maximum: 10000 }
end
