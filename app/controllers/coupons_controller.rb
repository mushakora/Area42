class CouponsController < ApplicationController
  before_action :authenticate_user!
  def index
  	  @item = Item.find(params[:id])
  	  session[:item][:coupon_price] = 50
  end

  private
  def item_params
  	  params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end
end
