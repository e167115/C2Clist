class User < ApplicationRecord
    has_secure_password
    before_save { self.email.downcase! }
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 250},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    
    has_many :posts        
    has_many :categories, through: :posts
                      
    #お気に入り機能
    has_many :favorites
    has_many :fav_posts, through: :favorites, source: :post
    
    def like(post)
        favorites.find_or_create_by(post_id: post.id)
    end    
    
    def unlike(post)
       favorite = favorites.find_by(post_id: post.id) 
       favorite.destroy if favorite
    end    
    
    def favoriting?(post)
        self.fav_posts.include?(post)
    end
end
