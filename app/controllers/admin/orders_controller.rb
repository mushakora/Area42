class Admin::OrdersController < ApplicationController
  before_action :admin_user
  def index
      @orders = Order.page(params[:page]).reverse_order.per(10)
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @materials = Material.all
    @order.order_materials.build
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:delivery_date, order_materials_attributes: [:material_id, :material_count])
  end

  def admin_user
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
