class HomeController < ApplicationController
  def top
  end

  def about
  end

  def portfolio
      render layout: false
  end
end
