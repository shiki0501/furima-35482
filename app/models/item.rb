class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end

  validates :price, numericality: { only_integer: true }
  validates_inclusion_of :price, in: 300..9_999_999
end
