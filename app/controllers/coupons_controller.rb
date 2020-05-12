class CouponsController < ApplicationController
  before_action :authenticate_user!
  def index
  	  @item = Item.find(4)
  	  @user = current_user
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end
end
