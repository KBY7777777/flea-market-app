class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create, :sell ]
  
  def index
  end

  def purchase
  end

  def sell
    @item = Item.new
  end

  def item_details
  end
  

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # def new
  #   @item = Item.new
  # end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path 
    else
      render :sell
    end
  end

  private

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(:item_name,:item_text,:item_status,:delivery_charge,:delivery_area,:delivery_day,:price, :category_id, :brand).merge(user_id: current_user.id)
  end

end

