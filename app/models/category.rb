class Category < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}
    has_many :posts
    has_many :users, through: :posts 
    
end
