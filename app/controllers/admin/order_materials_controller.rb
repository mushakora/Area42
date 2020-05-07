class Admin::OrderMaterialsController < ApplicationController
  before_action :admin_user
  def create
      ActiveRecord::Base.transaction do
      order = Order.create
      order_params.each do |param|

        if param[:material_count].to_i > 0
          order_material = OrderMaterial.new(order_material_params)
          order_material.material_id = param[:material_id]
          order_material.material_count = param[:material_count]
          order_material.order = order
          order_material.save!
        end
      end
    end
    redirect_to 'new'
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
