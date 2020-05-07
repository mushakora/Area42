class Admin::OrdersController < ApplicationController
  before_action :admin_user
  def index
      @orders = Order.page(params[:page]).reverse_order.per(10)
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
      materials = Material.all
      @order_materials = []
      materials.each do |material|
        order_material = OrderMaterial.new(material: material)
        @order_materials.push(order_material)
      end
  end



  def create
      @order = Order.new(order_params)
      redirect_to admin_orders_path
  end

  private
  def order_params
    params.permit(:dalivery_date)
  end

  def admin_user
      unless admin_signed_in?
      redirect_to root_path
      end
  end
end
