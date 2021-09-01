class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  belongs_to :buy

  attr_accessor :token
end
