class Admin::HomeController < ApplicationController
  def top
  end

  private
  def admin_user
      unless admin_signed_in?
      redirect_to root_path
      end
  end
end
