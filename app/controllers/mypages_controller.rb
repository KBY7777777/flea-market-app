class MypagesController < ApplicationController

  def index
    @display_counts = Item.where(user:current_user).count
    @buy_counts = Purchase.where(user:current_user).count
  end

  def display
    @items = Item.where(user:current_user)
  end

  def buydisplay
    @purchases = Purchase.where(user:current_user)
  end

  def creditcard
  end

  def logout
  end

  def payment
  end

end
