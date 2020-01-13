class Comment < ApplicationRecord

  validates :text, presence: true
  belongs_to :movie  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  
end


