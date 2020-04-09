class ToppagesController < ApplicationController
  
  def index
    
    if params[:category_id]
      #カテゴリーDBのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
      
      #category_id と紐づいた投稿を取得
      @posts = @category.posts.order(id: :desc).page(params[:page])
      @categories = Category.all
    else
      @posts = Post.all.order(id: :desc).page(params[:page])
      @categories = Category.all
    end
  end
  
  
end