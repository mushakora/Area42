class Admin::ItemsController < ApplicationController
before_action :admin_user
  def index
      @items = Item.all.order("sale_status")
  end

  def show
      @item = Item.find(params[:id])
  end

  def new
      @item = Item.new
  end

  def edit
      @item = Item.find(params[:id])
  end

  def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item)
  end

  def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to admin_item_path(@item)
  end

  private
  def item_params
      params.require(:item).permit(:name, :text, :price, :image, :sale_status)
  end

  def admin_user
      unless admin_signed_in?
      redirect_to root_path
      end
  end
end
