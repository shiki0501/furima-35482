class ItemsController < ApplicationController

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless 
      user_signed_in? == true
      redirect_to  user_session_path
    end
  end
  
  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
  end

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:delivery_charge_id,:shipping_area_id,:shipping_day_id,:price)
  end

  def image_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
