class UsersController < ApplicationController
  before_action :correct_user, only:[:show, :edit, :hide, :update]
  def show
      @user = current_user
      @item_ranking = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id)
      else
         render 'edit'
      end
  end

  def withdrawal
  end

  def hide
      @user = User.find(params[:id])
      @user.update(deleted_at: true)
      @user.update(user_status: '退会済')
      reset_session
      redirect_to root_path
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :address, :user_status, :email)
  end

  def correct_user
      if user_signed_in?
         user = User.find(params[:id])
         if current_user.id !=  user.id
            redirect_to root_path
         end
      end
  end

end
