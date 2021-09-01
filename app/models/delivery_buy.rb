class DeliveryBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :tell, :user_id, :item_id,
                :token

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                    building_name: building_name, tell: tell, token: token, buy_id: buy.id)
  end

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :tell, format: { with: /\A\d{10,11}\z/, message: 'is invalid.Only numbers within 11 digits can be saved' }
  end
end
