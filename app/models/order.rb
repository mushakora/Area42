class Order < ApplicationRecord
  has_many :order_materials
  accepts_nested_attributes_for :order_materials
end
