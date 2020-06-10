class FavoritesController < ApplicationController
  def create
      @item = Item.find(params[:item_id])
      favorite = current_user.favorites.new(item_id: @item.id)
      favorite.save
  end

  def destroy
  	  @item = Item.find(params[:item_id])
  	  favorite = current_user.favorites.find_by(item_id: @item.id)
  	  favorite.destroy
  end

  private
  def correct_user
      if user_signed_in?
         user = User.find(params[:id])
         if current_user.id != user.id
            redirect_to root_path
         end
      end
  end
end
