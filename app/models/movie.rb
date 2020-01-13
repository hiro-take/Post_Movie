class Movie < ApplicationRecord
  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :video, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :comments,  dependent: :destroy


  def self.search(search)
    return Movie.all unless search
    Movie.where('title LIKE(?)', "%#{search}%")
  end
end
