class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image


  validates :category_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  with_options presence: true do
    validates :name
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end


  # private
  # def item_params
  #   params.require(:item).permit(:image).merge(user_id: current_user.id)
  # end
end
