class CouponsController < ApplicationController
  before_action :authenticate_user!
  def index
  	  @item = Item.find(4)
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end
end
