class Admin::OrdersController < ApplicationController
  before_action :admin_user
  def index
  	  @orders = Order.page(params[:page]).reverse_order.per(10)
  end

  def show
  	  @order = Order.find(params[:id])
      @materials = @order.materials
  end

  def new
  	  @materials = Material.all
  	  @order = Order.new
  end

  def create
  	  @order = Order.new(order_params)
  	  @order.save
  	  redirect_to admin_order_path(@order)
  end

  private
  def order_params
  	  params.require(:order).permit(:material_id, :material_count)
  end

  def admin_user
  	  unless admin_signed_in?
  	  redirect_to root_path
  	  end
  end
end
