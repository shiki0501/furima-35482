class DeliverysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @delivery_buy = DeliveryBuy.new
  end
  
  def create
    @delivery_buy = DeliveryBuy.new(deliverybuy_params)
    if @delivery_buy.valid?
      @delivery_buy.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index 
    end
  end

  private

  def deliverybuy_params
    params.require(:delivery_buy).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :tell) 
  end

end
