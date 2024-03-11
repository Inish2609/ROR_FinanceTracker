class PagesController < ApplicationController
  def home
  end
  def about
  end
  def my_stock
    @traked_stocks = current_user.stocks
  end
end
