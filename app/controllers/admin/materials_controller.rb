class Admin::MaterialsController < ApplicationController
  before_action :admin_user
  def index
  	  @materials = Material.all
      @material = Material.new
  end

  def edit
  	  @material = Material.find(params[:id])
  end

  def create
  	  @material = Material.new(material_params)
  	  @material.save
  	  redirect_to admin_materials_path
  end

  def update
  	  @material = Material.find(params[:id])
  	  @material.update(material_params)
  	  redirect_to admin_materials_path
  end

  private
  def material_params
  	  params.require(:material).permit(:genre, :name)
  end

  def admin_user
  	  unless admin_signed_in?
  	  redirect_to root_path
  	  end
  end

end
