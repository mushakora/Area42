class Admin::UsersController < ApplicationController
  before_action :admin_user
  def index
  	  @users = User.all.page(params[:page]).search(params[:search])
  end

  def show
  	  @user = User.find(params[:id])
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
  	  @user = User.find(params[:id])
  	  @user.update(user_params)
  	  redirect_to admin_user_path(@user)
  end

  private
  def user_params
  	  params.require(:user).permit(:first_name, :last_name, :note, :birthday, :address, :user_status, :email)
  end

  def admin_user
  	  unless admin_signed_in?
  	  redirect_to root_path
  	  end
  end
end
