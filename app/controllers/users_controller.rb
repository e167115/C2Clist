class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit]
  

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "会員登録を完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "会員登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "会員情報を更新しました"
      redirect_to @user
    else
      flash[:danger] = "会員情報を更新できませんでした"
      render :edit
    end
  end
  
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
end