class HomeController < ApplicationController
  def top
  	  @items = Item.all
  end

  def about
  end

  def login
  end
end
