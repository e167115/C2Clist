class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: {maximum: 255}
  validates :contacthere, presence: true, length: {maximum: 50}
  
  
end
