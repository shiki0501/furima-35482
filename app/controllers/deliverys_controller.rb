class DeliverysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    binding.pry
    @delivery = Delivery.new(delivery_params)
    if @delivery.valid?
      @delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def delivery_params
    params.require(:delivery)
    # params.require(:delivery).permit(:shipping_area_id).merge(token: params[:token])
  end

end
