class ItemsController < ApplicationController
  def index
      @items = Item.all
      @item_ranking = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def show
  	  @item = Item.find(params[:id])
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end

end
