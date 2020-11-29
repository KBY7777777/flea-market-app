class MypagesController < ApplicationController

  def index
  end

  def display
    @items = Item.all
    @nickname = current_user.nickname
  end

  def creditcard
  end

  def logout
  end

  def payment
  end

end
