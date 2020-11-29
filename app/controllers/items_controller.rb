class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create, :sell, :edit, :update]
  before_action :set_item, only: [:show, :destroy]
  before_action :edit_item, only: [:edit, :update]
  
  
  def index
    @items = Item.all
  end

  def purchase
  end

  def sell
    @item = Item.new
    @item.item_images.build
  end

  def item_details
  end
  

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path 
    else
      @item.item_images.build
      render :sell
    end
  end

  def edit
    @item.item_images.build

    #カテゴリーデータ取得
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent
    @category_parent = @child_category.parent
    #カテゴリー一覧を作成
    @category = Category.find(params[:id])
    # 紐づく孫カテゴリーの親（子カテゴリー）の一覧を配列で取得
    @category_children = @item.category.parent.parent.children
    # 紐づく孫カテゴリーの一覧を配列で取得
    @category_grandchildren = @item.category.parent.children
  end

  def update
    if @item.update(item_params)
      redirect_to mypages_path{current_user.id}
    else
      render :edit
    end
  end

  def show
    @itemstatus = Itemstatus.find(@items.item_status)
    @deliveryarea = Deliveryarea.find(@items.delivery_area)
    @deliverycharge = Deliverycharge.find(@items.delivery_charge)
    @deliveryday = Deliveryday.find(@items.delivery_day)
    @grandchild = Category.find(@items.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def destroy
    if set_item.destroy
      redirect_to root_path 
    else
      render :show
    end
  end

  private

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(:item_name,:item_text,:item_status,:delivery_charge,:delivery_area,:delivery_day,:price, :category_id, :brand, item_images_attributes: [:url, :id, :_destroy]).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end

  def edit_item
    @item = Item.find(params[:id])
  end

end
