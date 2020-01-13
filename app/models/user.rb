class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :movies
        has_many :comments # commentsテーブルとのアソシエーション



        validates :nickname, presence: true, length: { maximum: 7 }
        validates :password, format: { with: /\A[a-z\d]{6,100}+\z/i}, presence: true
        validates :password_confirmation, presence: true

        validates :email, uniqueness: true, presence: true
end
