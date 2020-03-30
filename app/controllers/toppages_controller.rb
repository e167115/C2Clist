class ToppagesController < ApplicationController
  
  def index
    @posts = Post.all.order(id: :desc).page(params[:page])
    @categories = Category.all
    
  end
  
  
end