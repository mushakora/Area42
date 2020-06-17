class Admin::HomeController < ApplicationController
  def top
      @address1 = User.where(address:'六本木')
      @address2 = User.where(address:'赤坂')
      @address3 = User.where(address:'銀座')
  end

  private
  def admin_user
      unless admin_signed_in?
      redirect_to root_path
      end
  end
end
