class DeliverysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @delivery_buy = DeliveryBuy.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @delivery_buy = DeliveryBuy.new(delivery_params)
    if @delivery_buy.valid?
      Payjp.api_key = ""
      Payjp::Charge.create(
        amount: @item[:price],
        card: @delivery_buy.token,
        currency: 'jpy'
      )
      @delivery_buy.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index 
    end
  end

  private

  def delivery_params
    params.require(:delivery_buy).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :tell,)
    .merge(token: params[:token])
  end

  def buy_params
    params.require(:delivery_buy).permit(:price)
  end

end
