class HomeController < ApplicationController
  def top
  end

  def about
  end

  def portfolio
      render :layout => 'portfolio'
  end
end
