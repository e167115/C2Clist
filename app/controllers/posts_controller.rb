class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :edit]
  
  
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
  
  def show
    @post = Post.find_by(id: params[:id])
    @category = Category.find_by(id: @post.category_id)
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success]= "投稿完了"
      redirect_to root_url
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end
  
  
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿を更新しました'
      redirect_to @post
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:success] = '投稿は削除されました'
    redirect_to root_url
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :contacthere, :category_id, :image)
  end
  
  
end
