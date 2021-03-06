class DeliverysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_delivery, only: [:index, :create]

  def index
    @delivery_buy = DeliveryBuy.new
    if current_user.id == @item.user.id || !(@item.buy.nil?)
      redirect_to root_path
    end
  end

  def create
    @delivery_buy = DeliveryBuy.new(delivery_params)
    if @delivery_buy.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],
        card: @delivery_buy.token,
        currency: 'jpy'
      )
      @delivery_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:delivery_buy).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :tell)
          .merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_delivery
    @item = Item.find(params[:item_id])
  end
end
