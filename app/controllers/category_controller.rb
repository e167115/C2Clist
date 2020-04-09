class CategoryController < ApplicationController
  
  def index
     @posts = Post.all.order(id: :desc).page(params[:page])
     @categories = Category.all
  end
    
  
  def show
  end
end
