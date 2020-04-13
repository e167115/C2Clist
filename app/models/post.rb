class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  #お気に入り機能
  has_many :favorites
  has_many :users, through: :favorites
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: {maximum: 255}
  validates :contacthere, presence: true, length: {maximum: 50}
  
  
end
