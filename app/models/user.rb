class User < ApplicationRecord
    has_secure_password
    before_save { self.email.downcase! }
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 250},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    
    has_many :posts        
    has_many :categories, through: :posts
                      
end
