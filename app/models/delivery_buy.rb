class DeliveryBuy
  include ActiveModel::Model
  attr_accessor :postal_code,:shipping_area_id,:municipality,:address,:building_name,:tell,:buy_id,:user_id,:item_id,:token

  def save
    buy = Buy.create(user_id: current_user.id, item_id: @item.id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, tell: tell, token: token, buy_id: buy_id)
  end

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :municipality
    validates :address
    validates :tell, format: {with: /\A\d{11}\z/ , message: "is invalid. Include hyphen(-)"}
  end

end