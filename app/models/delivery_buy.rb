class DeliveryBuy
  include ActiveModel::Model
  attr_accessor :postal_code,:shipping_area_id,:municipality,:address,:building_name,:tell,:buy_id,:user_id,:item_id

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, tell: tell, buy_id: buy_id)
  end

end