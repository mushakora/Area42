class Admin::OrderMaterialsController < ApplicationController
  before_action :admin_user
  def create
  	  @order_material = OrderMaterial.new
  	  redirect_to admin_orders_path
  end

  private
  def order_material_params
  	  params.require(:order_material).permit(:material_id, :order_id, :material_count)
  end

  def admin_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end
end
