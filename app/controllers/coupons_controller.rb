class CouponsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item_ranking = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  	@user = current_user
  end

  private
  def item_params
  	params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end
end
