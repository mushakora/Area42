class Admin::OrdersController < ApplicationController
  before_action :admin_user
  def index
  	  @orders = Order.page(params[:page]).reverse_order.per(10)
  end

  def show
  	  @order = Order.find(params[:id])
  end

  def new
  	  @materials = Material.all
  	  @order = Order.new
      @order_material = OrderMaterial.new
      render 'new'
  end

  def create
  	  @order = Order.new
  	  if @order.save
  	    redirect_to admin_order_path(@order)
      else
        render 'new'
      end
  end

  private
  def order_material_params
      params.require(:order).permit(:delivery_date)
  end

  def admin_user
  	  unless admin_signed_in?
  	  redirect_to root_path
  	  end
  end
end
